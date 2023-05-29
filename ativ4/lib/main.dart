import 'package:ativ4/routes/app_routes.dart';
import 'package:ativ4/views/cadastrar_user.dart';
import 'package:ativ4/views/home.dart';
import 'package:flutter/material.dart';
import 'views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EletroHome',
        theme: ThemeData(
          fontFamily: 'Helveltica',
          primarySwatch: Colors.pink,
        ),
        routes: {
          AppRoutes.LOGIN: (_) => Login_Page(),
          AppRoutes.HOME: (_) => Home(),
          AppRoutes.CADASTRAR: (_) => Cadastrar_User(),
        });
  }
}
