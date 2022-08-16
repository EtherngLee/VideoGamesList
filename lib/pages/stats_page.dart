import "package:flutter/material.dart";

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stats"),
        elevation: 10,
        backgroundColor: Color(0xff121212),
      ),
      body: Center(
          child: Text("Stats",
              style: TextStyle(fontSize: 60, color: Colors.white))));
}
