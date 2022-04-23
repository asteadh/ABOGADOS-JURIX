import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:jurix_abogados/controllers/MenuController.dart';
import 'package:jurix_abogados/screens/main/components/side_menu.dart';
import 'package:jurix_abogados/screens/main/home.dart';
import 'package:jurix_abogados/screens/main/main_screen.dart';
// import 'package:jurix_abogados/providers/logout.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ConIniciarSesion extends StatefulWidget with ChangeNotifier {
  //const ConIniciarSesion({Key? key}) : super(key: key);

  static const routeName = '/coniniciarsesion';

  @override
  State<ConIniciarSesion> createState() => _ConIniciarSesionState();
}

class _ConIniciarSesionState extends State<ConIniciarSesion> {
  // final cart = Provider.of<Home>(context);
  @override
  Widget build(BuildContext context) {
    var _selectedTabIndex = 0;
    return PlatformScaffold(
      // appBar: PlatformAppBar(
      //   title: PlatformText('sss'),
      //   trailingActions: [],
      // ),

      //#### Bottom Nav bar ####

      // bottomNavBar: PlatformNavBar(
      //   currentIndex: _selectedTabIndex,
      //   itemChanged: (index) => setState(
      //     () {
      //       _selectedTabIndex = index;
      //     },
      //   ),

      // items: [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.construction),
      //     label: 'dddddy',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.people),
      //     label: 'hhh',
      //     // activeIcon: Icon(Icons.abc),
      //   ),
      //   // BottomNavigationBarItem(),
      // ],
      // ),

      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuController(),
            ),
            ChangeNotifierProvider(
              create: (context) => MainScreen(),
            ),
            ChangeNotifierProvider(
              create: (context) => SideMenu(),
            ),
          ],
          child: MainScreen(),
        ),
        // LogOut(_userName),
      ),
    );
  }
}
