import 'package:flutter/material.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests',
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
          'Requests',
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
