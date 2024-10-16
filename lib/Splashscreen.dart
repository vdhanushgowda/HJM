import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and set the duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Animation duration
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);

    // Start the animation
    _controller!.forward();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {}); // Splash screen delay
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
  }

  @override
  void dispose() {
    _controller!.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        children: [
      Center(
        child: FadeTransition(
          opacity: _fadeAnimation!,
          child: Image.asset(
            'assets/hm-removebg-preview.png',
            width: 140,
            height: 140,
          ),
        ),
      ),
          Positioned(
            top: -70,
            left: -70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.0), // Circular border radius
              child: Image.asset(
                'assets/Chicken/Chicken-Curry-Cut-skin.jpg',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),

          Positioned(
            top: 200,
            left: -110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120.0), // Circular border radius
              child: Image.asset(
                'assets/Chicken/chicken-liver-raw-close-up-35780403.webp',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),

          Positioned(
            top: -70,
            right: -70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.0), // Circular border radius
              child: Image.asset(
                'assets/Mutton/Mutton-Chop-1.webp',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),

          Positioned(
            top: 450,
            right: -110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.0), // Circular border radius
              child: Image.asset(
                'assets/SeaFood/shutterstock_1285004545farmprawn.jpg',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),

          // Bottom left image
          Positioned(
            bottom: -70,
            left: -70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.0), // Circular border radius
              child: Image.asset(
                'assets/Pork/shoulder-of-pork-main-2048x1568.jpg',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),
          // Bottom right image
          Positioned(
            bottom: -70,
            right: -70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.0), // Circular border radius
              child: Image.asset(
                'assets/SeaFood/Basa-Fish-Fillets-Online.webp',
                width: 200,  // Increased width
                height: 200, // Increased height
                fit: BoxFit.cover, // Ensures the image covers the space
              ),
            ),
          ),


    ]
    )
    );
  }
}
