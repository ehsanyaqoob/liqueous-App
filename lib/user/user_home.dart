import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 16, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 200,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 20),
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/profile.jpg'),
                        ),
                        SizedBox(width: 28.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications,
                                    color: Colors.grey, size: 30),
                                SizedBox(width: 5),
                                Text(
                                  'ID: GLPRE8VRC',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // for generating user term sheet
                                      Navigator.pushNamed(context, '/Generate');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    icon: Icon(Icons.settings),
                                    label: Text(
                                      'Generate termsheet',
                                      style: TextStyle(
                                        fontFamily: 'Roboto-Bold.ttf',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 200,
                width: 90,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Qoutes',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              //fontFamily: 'Roboto-Bold.ttf'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '126',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Bold.ttf'),
                        ),
                      ],
                    ),
                    Text('Queries',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                    SizedBox(
                      height: 8,
                    ),
                    Text('By Agent: 3',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 200,
                width: 90,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Loans',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Roboto-Bold.ttf'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '14',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Bold.ttf'),
                        ),
                      ],
                    ),
                    Text('Requested',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Approved:3',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                  ],
                ),
              ),
            ),
          ),
          // 3rd
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 200,
                width: 90,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Tasks',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              //fontFamily: 'Roboto-Bold.ttf'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.orange[500],
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Bold.ttf'),
                        ),
                      ],
                    ),
                    Text('Open',
                        style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text('Closed : 3',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Container(
                height: 200,
                width: 90,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Clients',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              //fontFamily: 'Roboto-Bold.ttf'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                              fontSize: 62,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Bold.ttf'),
                        ),
                      ],
                    ),
                    Text('Active',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Prospects: 123',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontFamily: 'Roboto-Bold.ttf')),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 160,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Request Amount',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Bold.ttf',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$34936100.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          ' 14',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Requests',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.0,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 160,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Borro',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$31885500.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          ' 14',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' 3 approved',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 18.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 120,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Private Block Purchase',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          ' 0',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' approved',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 18),

          // lastlty adding two big height containers

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 800,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Loan Insights',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Engr Munib',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          '\$53000.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold.ttf',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'LTRY-Lottery.com lnc.Common\nStock',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('             ________________________________',
                            style: TextStyle(
                              fontFamily: 'Roboto-Bold.ttf',
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choudry',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          '\$53,000.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Bold.ttf',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.maps_home_work, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'LTRY-Lottery.com lnc.Common\nStock',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('           ________________________________',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Roboto-Bold.ttf',
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choudry',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Bold.ttf',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          '\$124,000.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.maps_home_work, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'LTRY-Lottery.com lnc.Common\nStock',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('           ________________________________',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Roboto-Bold.ttf',
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bashir Aslam',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          '\$47,500.00',
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold.ttf',
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.maps_home_work, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          'LTRY-Lottery.com lnc.Common\nStock',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold.ttf',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
// now updating second Column which will  contains 1 row Column(

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Tasks Center',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Roboto-Bold.ttf',
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Color.fromARGB(
                                                    255, 50, 12, 218),
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'New',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Color.fromARGB(
                                                    255, 13, 26, 206),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Colors.green,
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Closed',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Roboto-Bold.ttf',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Colors.grey[700],
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Submitted',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Roboto-Bold.ttf',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 50,
                                                fontFamily: 'Roboto-Bold.ttf',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'In-review',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Roboto-Bold.ttf',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Colors.grey[700],
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Re-opened',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Colors.grey[700],
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontFamily: 'Roboto-Bold.ttf',
                                                color: Colors.grey[700],
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Cancelled',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Roboto-Bold.ttf',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
