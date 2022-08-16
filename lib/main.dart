import 'package:flutter/material.dart';
import 'package:videogameslist/pages/discover_page.dart';
import 'package:videogameslist/pages/library_page.dart';
import 'package:videogameslist/pages/profile_page.dart';
import 'package:videogameslist/pages/stats_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videogames List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentindex = 1;
  final screens = [LibraryPage(), DiscoverPage(), ProfilePage(), StatsPage()];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(index: currentindex, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff121212),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 30,
          showUnselectedLabels: false,
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Library"),
            BottomNavigationBarItem(
                icon: Icon(Icons.games_rounded), label: "Discover"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.query_stats_rounded), label: "Stats"),
          ],
        ),
      );
}
