import 'package:flutter/material.dart';
import 'package:neosao_task/ui/pages/home/home_page.dart';
import 'package:neosao_task/ui/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoSao Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      home: const SplashScreen(),
      routes: <String,WidgetBuilder>{
        'splash':(BuildContext context) => new SplashScreen(),
        'home':(BuildContext context) => new HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
