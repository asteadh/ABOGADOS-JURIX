import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:jurix_abogados/screens/main/components/side_menu.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const routeName = '/taskscreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ggg'),
    );
    // Scaffold(
    //   //key: context.read<MenuController>().scaffoldKey,
    //   appBar: AppBar(title: Text('text')),
    //   drawer: SideMenu(),
    //   body: SafeArea(
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // We want this side menu only for large screen
    //         if (Responsive.isDesktop(context))
    //           Expanded(
    //             // default flex = 1
    //             // and it takes 1/6 part of the screen
    //             child: SideMenu(),
    //           ),
    //         // Expanded(
    //         //   // It takes 5/6 part of the screen
    //         //   flex: 5,
    //         //   child: DashboardScreen(),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
