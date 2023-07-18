import 'package:flutter/material.dart';

class SubmitQueryPage extends StatefulWidget {
  @override
  _SubmitQueryPageState createState() => _SubmitQueryPageState();
}

class _SubmitQueryPageState extends State<SubmitQueryPage> {
  String? _selectedOption;
  double _selectedAmount = 25000.0;
  double _minAmount = 25000.0;
  double _maxAmount = 804000.0;
  TextEditingController _amountTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountTextController.text = _selectedAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _amountTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Query'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 37),
            Text(
              'Are you applying for yourself or someone else?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedOption,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'myself',
                  child: Text('Myself'),
                ),
                DropdownMenuItem(
                  value: 'someone else',
                  child: Text('Someone else'),
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Amount \$',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _amountTextController,
              onChanged: (value) {
                setState(() {
                  _selectedAmount = double.tryParse(value) ?? _minAmount;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            Slider(
              min: _minAmount,
              max: _maxAmount,
              value: _selectedAmount,
              onChanged: (newValue) {
                setState(() {
                  _selectedAmount = newValue;
                  _amountTextController.text =
                      _selectedAmount.toStringAsFixed(0);
                });
              },
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  ' Min',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 300.0),
                Text(
                  'Max',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                height: 40,
                width: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Plan');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm Amount!',
                        style: TextStyle(
                          fontFamily: 'Roboto-Bold.ttf',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
