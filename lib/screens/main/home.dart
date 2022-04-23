import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:get/get.dart';
import 'package:jurix_abogados/screens/signIn/con_iniciar_sesion.dart';
import 'package:jurix_abogados/screens/signIn/sin_iniciar_sesion.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_auth_service.dart';
import '../../styles/colors/colors.dart';

import '../../styles/container_styles.dart';
import '../auth/auth_home.dart';

class Home extends StatefulWidget {
  //Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var logger = Logger();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  bool _isSignedIn = false;
  String _userId = "";
  String userMail = "";
  String _userName = "";
  //var logou = result;

  @override
  void initState() {
    // TODO: implement initState
    setUSerActionMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      //resizeToAvoidBottomInset: false,

      appBar: PlatformAppBar(
        title: PlatformText('Jurix'),
        trailingActions: [
          if (_isSignedIn)

            //v2
            // PlatformPopupMenu(
            //   options: [
            //     PopupMenuOption(label: 'Iniciaste sesion como $_userName'),
            //     PopupMenuOption(label: 'Cerrar sesión'),
            //   ],
            //   icon: Icon(Icons.account_box_rounded),
            // )

            //v1
            //EROR PLATFORM PlatformPopupMenu arreglar!!!!!!!
            Material(
              child: PopupMenuButton(
                icon: const Icon(
                  Icons.account_box_rounded,
                  color: Colors.white,
                ),
                color: spaceGray,
                elevation: 50.0,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: color3, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                // options: [
                //   PopupMenuOption(
                //     label: 'Iniciaste sesion como $_userName',
                //   ),
                // ],
                onSelected: (value) {},
                itemBuilder: (BuildContext buuilcontext) {
                  return [
                    // PopupMenuOption
                    PopupMenuItem(
                      child: PlatformText("Iniciaste sesion como $_userName"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        var result = _firebaseAuthService.signOut();
                        _firebaseAuthService.signInState().then((value) => {
                              setState(() {
                                _isSignedIn = value;
                              }),
                            });
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              decoration: userActionMenuItem,
                              child: PlatformText("Cerrar sesión"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            )
          else
            PlatformIconButton(
              onPressed: () {
                getToAuthScreen();
              },
              icon: const Icon(
                Icons.person_rounded,
                // color: Colors.white,
              ),
            ),
        ],
      ),
      body: _isSignedIn ? ConIniciarSesion() : const SinIniciarSesion(),
    );
  }

  getToAuthScreen() {
    Get.to(() => const AuthHome(title: 'Empieza a disfrutar Jurix'));
  }

  setUSerActionMenu() {
    _firebaseAuthService.signInState().then((value) => {
          setState(() {
            _isSignedIn = value;
            if (_isSignedIn) {
              _firebaseAuthService.currentUser().then((value) => {
                    setState(() {
                      _userId = value.id;
                      userMail = value.email;
                      final emailArray = userMail.split('@');
                      _userName = emailArray[0];
                    }),
                  });
            }
          }),
        });
  }
}
