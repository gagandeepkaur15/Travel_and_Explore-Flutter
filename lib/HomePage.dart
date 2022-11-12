import 'package:flutter/material.dart';
import './dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;

  List children = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        body: children[selectedItem],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 27, 26, 26),
          selectedItemColor: Color.fromARGB(255, 99, 246, 204),
          iconSize: 25,
          currentIndex: selectedItem,
          unselectedLabelStyle: const TextStyle(color: Colors.green),
          unselectedItemColor: Colors.white,
          onTap: (currIndex) {
            setState(() {
              selectedItem = currIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 27, 26, 26),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 27, 26, 26),
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 27, 26, 26),
              icon: Icon(Icons.camera_alt),
              label: 'camera',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 27, 26, 26),
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
