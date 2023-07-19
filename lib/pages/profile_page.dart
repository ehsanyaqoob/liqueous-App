import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(45.0),
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
          SizedBox(height: 16),
          ListTile(
            //  leading: Icon(Icons.person),
            title: Container(
              width: double.infinity,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
          ),
          ListTile(
            //    leading: Icon(Icons.email),
            title: Container(
              width: double.infinity,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          buildButton('Privacy', Icons.privacy_tip_outlined, '/Privacy'),
          buildButton(
              'Settings', Icons.settings_accessibility_outlined, '/Settings'),
          buildButton('Help & Support', Icons.help, '/Help'),
          buildButton('Invite a Friend!', Icons.person_2_sharp, '/Invite'),
        ],
      ),
    );
  }

  Widget buildButton(String text, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Roboto-Bold.ttf',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
