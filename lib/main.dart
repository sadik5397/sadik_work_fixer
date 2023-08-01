import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'others/colors.dart';
import 'others/console.dart';
import 'others/static_value.dart';
import 'single.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PRINT("---- $appName App ----\n---- © Developed by : S.a. Sadik ----\n---- sadik5397@gmail.com ----\n---- www.sadik.work/apps ----");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        enableLog: true,
        defaultTransition: Transition.fade,
        title: appName,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(useMaterial3: true, scaffoldBackgroundColor: MyColor.pageBackground),
        theme: ThemeData.light().copyWith(useMaterial3: true, scaffoldBackgroundColor: MyColor.pageBackground),
        home: const SadikWorkDataBaseFixer());
  }
}
