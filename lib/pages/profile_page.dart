import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        elevation: 10,
        backgroundColor: Color(0xff121212),
      ),
      body: Center(
          child: Text("Profile",
              style: TextStyle(fontSize: 60, color: Colors.white))));
}
