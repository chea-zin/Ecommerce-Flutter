import 'package:flutter/material.dart';

class Protilepage extends StatelessWidget {
  const Protilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Raza',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'ahmedraza@gmail.com',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.edit, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Shipping Address'),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment Method'),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Order History'),
              ),
              Divider(),
              Text('Support & Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.policy),
                title: Text('Privacy Policy'),
              ),
              ListTile(
                leading: Icon(Icons.article),
                title: Text('Terms & Conditions'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('FAQs'),
              ),
              Divider(),
              Text('Account Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
