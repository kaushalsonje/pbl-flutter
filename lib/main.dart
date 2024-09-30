import 'package:flutter/material.dart';
import 'package:login_signup/splash_screen.dart';
import 'package:login_signup/home_page.dart'; 
import 'package:login_signup/login_page.dart';
import 'package:login_signup/signup_page.dart';
import 'package:login_signup/forgot_password_page.dart';
import 'home_page.dart';
import 'profilepage.dart';
import 'AttendancePage.dart';
import 'ClubsPage.dart';
import 'TimetablePage.dart';
import 'TodoListPage.dart';
void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: StaticSplashScreen(), 
      routes: {
        HomePage.routeName: (context) => HomePage(), 
        LoginPage.routeName: (context) => LoginPage(),
        ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        AttendancePage.routeName:(context) =>AttendancePage(lecturesAttended: 260, totalLectures:454,),
        ClubsPage.routeName:(context)=>ClubsPage(),
        TimetablePage.routeName:(context) =>TimetablePage(),
        TodoListPage.routeName:(context) =>TodoListPage(),
      },
    );
  }
}

class StaticSplashScreen extends StatefulWidget {
  @override
  _StaticSplashScreenState createState() => _StaticSplashScreenState();
}

class _StaticSplashScreenState extends State<StaticSplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset('assets/4SQUARE.png'),
            const SizedBox(height: 20),
            const Text(
              '4SQUARE APP !!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
