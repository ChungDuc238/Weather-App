import 'package:flutter/material.dart';
import 'package:flutter_weather/Screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routerName = 'splash';
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    onInit(() => Navigator.of(context)
        .pushReplacementNamed(HomeScreen.routerName));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

Future<void> onInit(Function? onSuccess) async {
  Future.delayed(const Duration(seconds: 2), () {
    onSuccess?.call();
  });
}
