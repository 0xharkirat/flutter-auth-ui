
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';


import './home.dart';
import './sign_in.dart';
import './magic_link.dart';
import './update_password.dart';
import 'phone_sign_in.dart';
import './verify_phone.dart';
import './phone_sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: replace with your credentials
  await Supabase.initialize(
    url: 'https://hvjjvggueouofkqafawj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2amp2Z2d1ZW91b2ZrcWFmYXdqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM5ODA2MTMsImV4cCI6MjA1OTU1NjYxM30.m0VSa8jdoNcJFmS18xMwtM0P9yblakd2QgEXkW5kAqU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        colorScheme: ShadNeutralColorScheme.dark(), brightness: Brightness.dark,
        
      ),

      theme: ShadThemeData(
        colorScheme: ShadNeutralColorScheme.light(), brightness: Brightness.light,
        
      ),
      
      initialRoute: '/',
      routes: {
        '/': (context) => const SignUp(),
        '/magic_link': (context) => const MagicLink(),
        '/update_password': (context) => const UpdatePassword(),
        '/phone_sign_in': (context) => const PhoneSignIn(),
        '/phone_sign_up': (context) => const PhoneSignUp(),
        '/verify_phone': (context) => const VerifyPhone(),
        '/home': (context) => const Home(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text(
                'Not Found',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
