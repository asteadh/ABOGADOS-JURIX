import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:firedart/firedart.dart';
import 'package:jurix_abogados/screens/dashboard/dashboard_screen.dart';
import 'package:jurix_abogados/screens/dashboard/task_screen.dart';
import 'package:jurix_abogados/screens/main/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/MenuController.dart';
import '../screens/main/main_screen.dart';
// import 'package:jurix_abogados/providers/logout.dart';
import '../screens/signIn/con_iniciar_sesion.dart';
import '../screens/signIn/sin_iniciar_sesion.dart';
import '../screens/main/home.dart';
import '../services/firebase_auth_service.dart';
import '../services/utility_services.dart';
import 'styles/colors/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuth.initialize(
      'AIzaSyCw6SYSZfD_UdeAxh8OsKPscwd-_JoubWM', VolatileStore());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var logger = Logger();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final UtilityService _utilityService = UtilityService();
  bool _isOnline = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        // LogOut();
        Home();
        MainScreen();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ConIniciarSesion.routeName: (context) => ConIniciarSesion(),
          SinIniciarSesion.routeName: (context) => SinIniciarSesion(),
          DashboardScreen.routeName: (context) => DashboardScreen(),
          TaskScreen.routeName: (context) => TaskScreen(),
        },
        title: 'Jurix Abogados',
        home: MultiProvider(
          providers: [
            // //2da
            // ChangeNotifierProvider(
            //   create: (context) => MenuController(),
            // ),

            //
            ChangeNotifierProvider(
              create: (context) => ConIniciarSesion(),
            ),

            //2da
            // ChangeNotifierProvider(
            //   create: (context) => MainScreen(),
            // ),

            // //2da
            // ChangeNotifierProvider(
            //   create: (context) => SideMenu(),
            // ),
          ],
          child: _isOnline
              ? Home()
              : PlatformScaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                            color: color2, size: 50.0),
                        const SizedBox(
                          height: 30.0,
                        ),
                        PlatformText("Connection failed!"),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  checkConnection() {
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) =>
    _utilityService.checkConnectivity().then(
          (value) => {
            if (value != _isOnline)
              {
                setState(() {
                  _isOnline = value;
                })
              }
          },
        );
    // );
  }
}
