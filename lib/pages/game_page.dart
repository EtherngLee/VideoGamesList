import "package:flutter/material.dart";

class GamePage extends StatelessWidget {
  final String name;
  const GamePage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text(name),
          backgroundColor: Color(0xff121212),
        ),
        body: Center(
            child: Text(name,
                style: TextStyle(fontSize: 60, color: Colors.white))));
  }
}
