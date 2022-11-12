import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: const Center(
                  child: Icon(
                    Icons.filter,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              const Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              InkWell(
                child: const Center(
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: size.height - 150,
          child: ListView(
            children: [
              _buildListItem('assets/risotto.jpg', 'Risotto',
                  'A traditional Italian rice dish made from a short-grained, starchy variety of rice called Arborio rice')
            ],
          ),
        ),
      ],
    );
  }

  _buildListItem(String imgPath, String food, String desc) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: Image.asset(imgPath).image,
                fit: BoxFit.fill,
              ), // or AssetImage(imgPath)
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientText(
                  food,
                  style: const TextStyle(
                    fontSize: 40.0,
                  ),
                  colors: const [
                    Color.fromARGB(255, 26, 26, 26),
                    Color.fromARGB(255, 0, 146, 133),
                  ],
                ),
                Container(
                  width: 300,
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
