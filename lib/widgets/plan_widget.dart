import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chose ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Affordable ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Plan ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            CustomCard(
              title: '1 Year Plan',
              subtitle1: 'Premium Value: 40%',
              subtitle2: 'Gross Proceeds: \$27,200',
              subtitle3: 'Borrow Rate: 1%',
              onPressed: () {
                // Perform action when the button is pressed
              },
            ),
            SizedBox(height: 16.0),
            CustomCard(
              title: '3 Year Plan',
              subtitle1: 'Premium Value: 50%',
              subtitle2: 'Gross Proceeds: \$27,000',
              subtitle3: 'Borrow Rate: 0.8%',
              onPressed: () {
                // Perform action when the button is pressed
              },
            ),
            SizedBox(height: 16.0),
            CustomCard(
              title: '5 Year Plan',
              subtitle1: 'Premium Value: 55%',
              subtitle2: 'Gross Proceeds: \$26,900',
              subtitle3: 'Borrow Rate: 0.75%',
              onPressed: () {
                // Perform action when the button is pressed
              },
            ),
            SizedBox(height: 16.0),
            CustomCard(
              title: '123',
              subtitle1: 'Premium Value: 3%',
              subtitle2: 'Gross Proceeds: \$27,800',
              subtitle3: 'Borrow Rate: 3%',
              onPressed: () {
                // Perform action when the button is pressed
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final VoidCallback onPressed;

  const CustomCard({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.green),
                SizedBox(width: 8.0),
                Text(subtitle1),
              ],
            ),
            SizedBox(height: 14.0),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.green),
                SizedBox(width: 8.0),
                Text(subtitle2),
              ],
            ),
            SizedBox(height: 14.0),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.green),
                SizedBox(width: 8.0),
                Text(subtitle3),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('________________________________',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto-Bold.ttf',
                    ))
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit',
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
          ],
        ),
      ),
    );
  }
}
