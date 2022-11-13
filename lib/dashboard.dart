import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import './details_page.dart';

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
              _buildListItem('assets/indian.jpg', 'Indian',
                  'One of the world\'s most diverse cuisines, characterized by its sophisticated and subtle use of the many spices, vegetables, grains and fruits grown across India'),
              _buildListItem('assets/French.jpg', 'French',
                  'With its formal techniques, emphasis on fresh ingredients and simple flavors, pride in presentation, and rich and colorful history, French cuisine truly has come to rule the world'),
              _buildListItem('assets/risotto.jpg', 'Italian',
                  'Italian cuisine ranks alongside French cuisine in terms of worldwide fame. Pizza and pasta have become world dishes'),
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
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ), // or AssetImage(imgPath)
            ),

            //FOR BLURRING THE IMAGE

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
                    fontSize: 30,
                  ),
                  colors: const [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 0, 146, 133),
                  ],
                ),
                Container(
                  width: 300,
                  child: Text(
                    desc,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 99, 246, 204),
                  ),
                  child: const Text('Read More'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailsPage(imgPath:imgPath, title: food,)));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
