import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:liqueous/pages/invite_page.dart';
import 'package:liqueous/pages/profile_page.dart';
import 'API/Get_A_Today_API.dart';
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
import 'widgets/Submit.dart';
import 'widgets/generate_widget.dart';
import 'widgets/plan_widget.dart';

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
      // these are routes for all over the app
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
        '/Generate': (context) => QuotePage(),
        '/Submit': (context) => SubmitQueryPage(),
        '/Plan': (context) => PlanPage(), 
        '/Qoute': (context) => GenerateSheetPage(),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/logo.png',
                //fit: BoxFit.cover,
              ),
            ),
          ),

          // Progress Bar and Loading Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: LinearProgressIndicatorWithPercentage(
                  animation: _animationController,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
              ),
              SizedBox(height: 8),
              FadeTransition(
                opacity: _opacityAnimation,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LinearProgressIndicatorWithPercentage extends StatelessWidget {
  final Animation<double> animation;

  const LinearProgressIndicatorWithPercentage({
    Key? key,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Column(
          children: [
            LinearProgressIndicator(
              value: animation.value,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 4),
            Text(
              '${(animation.value * 100).toInt()}%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
