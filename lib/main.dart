import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/consts/app_themes.dart';
import 'package:flutter_weather_app/page/home_page.dart';

/*
Created by Axmadjon Isaqov on 09:08:47 31.08.2022
© 2022 @axi_dev 
*/
/*
Mavzu:::Weather App Ui
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(const MyApp());
}

ValueNotifier<ThemeMode?> currentTheme = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode?>(
        valueListenable: currentTheme,
        builder: (context, themeMode, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeMode,
            theme: WeatherAppTheme.lightTheme(),
            darkTheme: WeatherAppTheme.darkTheme(),
            home: const HomePage(),
          );
        });
  }
}
