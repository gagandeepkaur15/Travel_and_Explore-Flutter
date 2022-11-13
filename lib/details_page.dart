import 'dart:ui';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imgPath, title;
  const DetailsPage({
    super.key,
    required this.imgPath,
    required this.title,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        )),
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imgPath), fit: BoxFit.cover),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 70, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListItem('assets/biryani.jpg', 'Biryani'),
                      _buildListItem('assets/chaat.jpg', 'Chaat'),
                      _buildListItem('assets/dosa.jpg', 'Dosa'),
                    ],
                  ),
                ),
                const Text(
                  'Sweet Dishes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListItem('assets/jalebi.jpg', 'Jalebi'),
                      _buildListItem('assets/Kaju-katli.jpg', 'Kaju Katli'),
                      _buildListItem('assets/halwa.jpg', 'Moong Dal Halwa'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(String imgPath, String name) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 175,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.bookmark_border,
                    color: Color.fromARGB(255, 99, 246, 204),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 125,
            left: 15,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
