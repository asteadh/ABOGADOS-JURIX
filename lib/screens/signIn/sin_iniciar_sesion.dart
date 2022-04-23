import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:get/instance_manager.dart';
import 'package:jurix_abogados/screens/auth/auth_home.dart';
import 'package:get/get.dart';

class SinIniciarSesion extends StatelessWidget {
  const SinIniciarSesion({Key? key}) : super(key: key);
  static const routeName = '/sininiciarsesion';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Image(
              image: const AssetImage('assets/logos/jurix_logo.png'),
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            const SizedBox(
              height: 15.0,
            ),
            PlatformText(
              '- Haz el tracking de todas tus causas ',
              softWrap: true,
              style: Theme.of(context).textTheme.headline5,
              // textAlign: TextAlign.end,
            ),
            SizedBox(height: 10),
            PlatformText(
              '- Maneja tus tarreas en una sola aplicación ',
              softWrap: true,
              style: Theme.of(context).textTheme.headline5,
              // textAlign: TextAlign.end,
            ),
            SizedBox(height: 10),
            PlatformText(
              '- Maneja el calendario de todas tus causas, puedes compartirlo con tu equipo! ',
              softWrap: true,
              style: Theme.of(context).textTheme.headline5,
              // textAlign: TextAlign.end,
            ),
            SizedBox(height: 10),
            PlatformText(
              '- Calcula el costo de tus causas ',
              softWrap: true,
              style: Theme.of(context).textTheme.headline5,
              // textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 10,
            ),
            PlatformElevatedButton(
              onPressed: () {
                getToAuthScreen();
              },
              child: PlatformText('Iniciar Sesión'),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }

  getToAuthScreen() {
    Get.to(() => const AuthHome(title: 'Empieza a disfrutar Jurix'));
  }
}
