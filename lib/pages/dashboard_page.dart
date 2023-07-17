import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Roboto-Bold.ttf',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Your Dashboard',
          style: TextStyle(
            fontFamily: 'Roboto-Bold.ttf',
            fontSize: 20,
            color: Colors.grey,
          ),
        )
      ])),
    );
  }
}
