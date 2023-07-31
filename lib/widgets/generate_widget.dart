import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../API/Get_A_Today_API.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generate Sheet Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GenerateSheetPage(),
    );
  }
}

class GenerateSheetPage extends StatelessWidget {
  String selectedCountryCode = 'US'; // Default country code
  final Quote? selectedQuote;

  GenerateSheetPage({this.selectedQuote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Sheet Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the selected quote here
            // on top of the generate term sheet page
            if (selectedQuote != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '${selectedQuote?.name ?? 'N/A'} ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${selectedQuote?.exchangeName ?? 'N/A'} ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            SizedBox(
              width: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${selectedQuote?.symbol ?? 'N/A'} ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('_______________________________________________',
                    style: TextStyle(
                      fontFamily: 'Roboto-Bold.ttf',
                      color: Colors.grey,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Your',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  'Estimate ',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Now ',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please complete all the fields',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Full Name ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your full name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Mobile Number ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: CountryCodePicker(
                    onChanged: (value) {
                      selectedCountryCode = value.dialCode!;
                    },
                    initialSelection: selectedCountryCode,
                    favorite: ['US', 'IN', 'GB'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Number of shares you own ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Total number of shares you own',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Are You Officer/Director? ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Yes/No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Use of proceeds ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the use of proceeds',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Transaction type ',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter the transaction type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                height: 40,
                width: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Submit');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Submit Query!',
                    style: TextStyle(
                      fontFamily: 'Roboto-Bold.ttf',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
