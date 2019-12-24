import 'package:flutter/material.dart';
import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/pages/users/login_page.dart';
import 'package:wanniu_app/styles/app_styles.dart';
import 'package:wanniu_app/utils/route_util.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '百姓生活+',
        navigatorKey: navGK,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Colors.transparent,
            scaffoldBackgroundColor: Colors.transparent,
            primaryColor: AppColors.Primary,
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: AppColors.FontColor,
              ),
              textTheme: TextTheme(
                title: TextStyle(
                  fontSize: 17,
                  color: AppColors.FontColor,
                ),
              ),
            )),
        home: LoginPage());
  }
}
