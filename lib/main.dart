import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/Screens/spashScreen.dart';
import 'package:provider/provider.dart';

import './provider/weatherProvider.dart';
import 'screens/homeScreen.dart';
import 'screens/sevenDayForecastDetailScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        home: SplashScreen(),
        // routes: {
        //   WeeklyScreen.routeName: (ctx) => WeeklyScreen(),
        // },
        onGenerateRoute: (settings) {
          final arguments = settings.arguments;
          if (settings.name == SevenDayForecastDetail.routeName) {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => SevenDayForecastDetail(
                initialIndex: arguments == null ? 0 : arguments as int,
              ),
              transitionsBuilder: (ctx, a, b, c) => CupertinoPageTransition(
                primaryRouteAnimation: a,
                secondaryRouteAnimation: b,
                linearTransition: false,
                child: c,
              ),
            );
          }
          if (settings.name == SplashScreen.routerName) {
            return MaterialPageRoute(builder: (_) => SplashScreen());
          }
          // Unknown route
          return MaterialPageRoute(builder: (_) => HomeScreen());
        },
      ),
    );
  }
}
