import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katbin/src/pages/home_page.dart';
import 'package:katbin/src/theme/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Katbin',
      initialRoute: '/',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
      ],
    );
  }
}
