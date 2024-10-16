import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jala/LoginScreen.dart';
import 'package:jala/Splashscreen.dart';
import 'package:jala/signupscreen.dart';
import 'package:jala/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:jala/Cart/CartProvider.dart'; // Ensure this import is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization for web and mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCyPlN_1_7Hdu-RI44SeSFNnf7TuLl-stg",
        appId: "1:952788109237:android:20fb77395ace1bad937bfc",
        messagingSenderId: "952788109237",
        projectId: "jala-76e1f",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // Move the runApp() call outside the main function
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jala',
      home: SplashScreen(),
      routes: {
        '/login': (context) => Homepage(), // Fix the route to point to HomeScreen
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
