import 'package:flutter/material.dart';

import '../User/user_analytics.dart';
import '../User/user_notification.dart';
import '../User/user_home.dart';
import '../User/user_search.dart';
import '../user/user_messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // naviigate around the buttom nav bar
  int _selectedIndex = 0;
  int _currentIndex = 0;
  void _navigateButtonNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // diff pages to navigate
  final List<Widget> _children = [
    UserHome(),
    UserSearch(),
    UserAnalytics(),
    UserNotification(),
    UserMessages(),
    // lsit for other content of the body
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.dark_mode_rounded,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 7.0,
          ),
          IconButton(
            icon: Icon(
              Icons.notification_add,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 7.0,
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('images/nft.jpg'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Liqueous',
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold.ttf',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                //
                Navigator.pushNamed(context, '/Dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page_sharp),
              title: Text(
                'Requests',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                //
                Navigator.pushNamed(context, '/Requests');
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text(
                'Tasks Center',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                //
                Navigator.pushNamed(context, '/Tasks');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Logout');
              },
            ),
            SizedBox(
              height: 250,
            ),
            ListTile(
              leading: Icon(Icons.merge_outlined),
              title: Text(
                'Version',
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                // TODO: Navigate to settings screen
              },
            ),
          ],
        ),
      ),
      // now body of homepage
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _navigateButtonNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_sharp), label: 'analytics'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important), label: 'notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Messages'),
        ],
      ),
    );
  }
}
