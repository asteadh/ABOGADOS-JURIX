import 'package:flutter/foundation.dart';
import 'package:jurix_abogados/screens/dashboard/task_screen.dart';

import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget with ChangeNotifier {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ChangeNotifier {
// Widget showedscreen = Provider.of(context);
  @override
  void didChangeDependencies() {
    Widget showedScreen = Provider.of<SideMenu>(context).screenShowned;
    if (kDebugMode) {
      print('change');
    }
    // build(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // didChangeDependencies();
      print('Set State');
    });
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: Responsive.isDesktop(context) ? null : SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,

              //########CHANGE WHEN PRESED DRAWER#####
              child: ChangeNotifierProvider(
                create: (context) {
                  DashboardScreen();
                },
                child: Consumer<SideMenu>(
                  builder: (context, value, child) => Text(value.drawer),
                ),
              ),
              // Provider.of<SideMenu>(context).screenShowned,

              // child:
              //     // TaskScreen(),
              //     DashboardScreen(),
            ),
            // print('Provider.of<SideMenu>(context, listen: false).drawer')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    // Provider.of<SideMenu>(context, listen: false).screenshowned;
  }
}
