import "package:flutter/material.dart";

class LibraryPage extends StatelessWidget {
  final tabs = [
    "Playing",
    "Plan to Play",
    "On Hold",
    "Completed",
    "Dropped",
    "All",
  ];
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Library"),
            backgroundColor: Color(0xff121212),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            elevation: 10,
            automaticallyImplyLeading: false,
            bottom: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [for (final tab in tabs) Tab(text: tab)]),
          ),
          body: Center(
              child: Text("Library",
                  style: TextStyle(fontSize: 60, color: Colors.white)))));
}
