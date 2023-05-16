import 'package:flutter/material.dart';
// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      child: Stack(
        children: [
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  const Text(
                    '41',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget buildTitleSection(int index) {
      return Positioned(
        top: 16,
        left: 16,
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.8),
            shape: CircleBorder(),
          ),
          child: Text(
            '#$index.',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }


    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Positioned(
      top: 16,
      right: 16,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16),
        child: Container(
          width: 180,
          height: 70,
          color: Colors.white.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
              _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
              _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
            ],
          ),
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Image.asset(
                    'images/lake.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  titleSection,
                  buildTitleSection(index),
                  buttonSection,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}