import 'package:get_storage/get_storage.dart';
import 'package:prudential_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prudential_test/utils/colors.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prudential Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Cc.red_prudential,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: Routes.initial,
      getPages: Pages.getPages(),
    );
  }
}