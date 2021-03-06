import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jurix_abogados/screens/dashboard/dashboard_screen.dart';
import 'package:jurix_abogados/screens/dashboard/task_screen.dart';

class SideMenu extends StatelessWidget with ChangeNotifier {
  // const SideMenu({
  //   Key? key,
  // }) : super(key: key);
  // SideMenu(drawer);
  Widget screenShowned = DashboardScreen();
  String drawer = '0';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/logos/jurix_logo.png"),
          ),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              drawer = '0';
              // screenShowned = DashboardScreen();
              print('Dashbord');
              notifyListeners();
              // Navigator.of(context)
              //     .pushReplacementNamed(DashboardScreen.routeName);
            },
          ),
          DrawerListTile(
            title: "Transaction",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              drawer = '1';
              screenShowned = TaskScreen();
              notifyListeners();
            },
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              print('Task');
              drawer = '2';
              screenShowned = TaskScreen();
              notifyListeners();
              // Navigator.of(context).pushReplacementNamed(TaskScreen.routeName);
            },
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              print('Documents');
            },
          ),
          DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
