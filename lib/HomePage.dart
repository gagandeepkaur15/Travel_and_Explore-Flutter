import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 27, 26, 26),
        selectedItemColor: Color.fromARGB(255, 99, 246, 204),
        iconSize: 25,
        currentIndex: selectedItem,
      ),
    );
  }
}
