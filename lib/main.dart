import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopnow/loginscreen/login_screen.dart';
import 'package:shopnow/navigation_provider/navigation_provider.dart';
import 'package:shopnow/provider/providerclass.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providerclass()),
         ChangeNotifierProvider(create: (_) => Providerchange()),
         ChangeNotifierProvider(create: (_)=> NavigationProvider()),
         
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
