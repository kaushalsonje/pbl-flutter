import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:login_signup/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isImagesVisible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });

    
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isImagesVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            top: 15,
            left: 0,
            child: AnimatedOpacity(
              opacity: _isImagesVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/TOPLEFT.png', 
                width: 100,
                height: 100,
              ),
            ),
          ),
          
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isImagesVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/BOTTOMRIGHT.png', 
                width: 100,
                height: 100,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: const Duration(milliseconds: 100),
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  text: const [
                    'WELCOME TO 4SQUARE',
                  ],
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 390.0,
                  child: AnimatedOpacity(
                    opacity: _isImagesVisible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      'assets/splashscreenimg.png', 
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: const Duration(milliseconds: 75),
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  text: const [
                    'BY STUDENTS FOR STUDENTS',
                  ],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
