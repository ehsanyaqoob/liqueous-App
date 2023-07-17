import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// login screen
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LogIn',
          style: TextStyle(
            fontFamily: 'Roboto-Bold.ttf',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      height: 200,
                      width: 200,
                      image: AssetImage('images/logo-full.png'),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back,',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Bold.ttf'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Bold.ttf',
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber); // Use the phone number
              },
              inputDecoration: InputDecoration(
                hintText: '',
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20),
            // TextFormField(
            //   decoration: InputDecoration(
            //     hintText: 'Password',
            //     labelText: 'Password',
            //     prefixIcon: Icon(Icons.lock_clock_outlined),
            //     suffixIcon: Icon(Icons.visibility_off),
            //   ),
            //   obscureText: true,
            // ),
            // SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // forgot password action
                },
                child: Text(
                  'Forgot your phone number?',
                  style: TextStyle(
                      color: Colors.grey, fontFamily: 'Roboto-Bold.ttf'),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/verify');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'LogIn',
                  style: TextStyle(
                    fontFamily: 'Roboto-Bold.ttf',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Signup');
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'New user?',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold.ttf',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' SignUp',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold.ttf',
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



           // this code now we have to make these textfields to make sure that
          // they will accept phone number with country code as a textfields.
          //  //
          //   SizedBox(height: 10),
          //   TextFormField(
          //     decoration: InputDecoration(
          //       hintText: 'Email',
          //       labelText: 'Email',
          //       prefixIcon: Icon(Icons.person),
          //     ),
          //   ),
          //   SizedBox(height: 20),
          //   TextFormField(
          //     decoration: InputDecoration(
          //       hintText: 'Password',
          //       labelText: 'Password',
          //       prefixIcon: Icon(Icons.lock_clock_outlined),
          //       suffixIcon: Icon(Icons.visibility_off),
          //     ),
          //     obscureText: true,
          //   ),
           