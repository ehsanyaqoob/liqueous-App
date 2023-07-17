import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:liqueous/pages/invite_page.dart';
import 'package:liqueous/pages/profile_page.dart';
import 'pages/darkmood_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/help&support_page.dart';
import 'pages/logout_page.dart';
import 'pages/notification_page.dart';
import 'pages/privacy_page.dart';
import 'pages/requests_page.dart';
import 'pages/Tasks_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'screens/login_screen.dart';
import 'screens/signUpscreen.dart';
import 'screens/verifyscreen.dart';
import 'widgets/generate_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        // Additional theme customization
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/verify': (context) => VerifyScreen(),
        '/home': (context) => HomePage(),
        '/Requests': (context) => RequestsPage(),
        '/Logout': (context) => LogOutPage(),
        '/Tasks': (context) => TasksPage(),
        '/Dashboard': (context) => DashboardPage(),
        '/Profile': (context) => ProfilePage(),
        '/Invite': (context) => InvitePage(),
        '/Privacy': (context) => PrivacyPage(),
        '/Settings': (context) => SettingsPage(),
        '/Help': (context) => HelpPage(),
        '/Notification': (context) => NotificationPage(),
        '/DarkMood': (context) => DarkMoodPage(),
        '/Generate': (context) => GenerateSheetPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Logo
          Positioned.fill(
            child: Image.asset(
              'images/logo.png',
              //fit: BoxFit.cover,
            ),
          ),

          // Progress Bar and Loading Text
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: SizedBox()), // Empty space above the progress bar
                DotProcessingAnimation(),
                SizedBox(height: 16),
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DotProcessingAnimation extends StatefulWidget {
  @override
  _DotProcessingAnimationState createState() => _DotProcessingAnimationState();
}

class _DotProcessingAnimationState extends State<DotProcessingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dot(animation: _animationController, offset: 0),
        SizedBox(width: 8),
        Dot(animation: _animationController, offset: 250),
        SizedBox(width: 8),
        Dot(animation: _animationController, offset: 500),
        SizedBox(width: 8),
        Dot(animation: _animationController, offset: 500),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final Animation<double> animation;
  final double offset;

  const Dot({
    Key? key,
    required this.animation,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value * offset),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
