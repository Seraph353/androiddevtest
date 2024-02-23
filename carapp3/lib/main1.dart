import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Callums Cars',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentImageIndex = 0;
  final PageController _pageController = PageController();
  final List<String> carImages = [
    'assets/car1.png',
    'assets/car2.png',
    'assets/car3.png',
    // Add more image paths as needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liams Cars',
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 195, 196, 197),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 219, 43, 43),
      ),
      body: Container(
        color: const Color.fromARGB(255, 127, 125, 125),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Liams Cars',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 246, 247, 246),
                ),
              ),
              const SizedBox(height: 20.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      // Swipe Right
                      if (currentImageIndex > 0) {
                        setState(() {
                          currentImageIndex--;
                          _pageController.animateToPage(
                            currentImageIndex,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        });
                      }
                    } else if (details.primaryVelocity! < 0) {
                      // Swipe Left
                      if (currentImageIndex < carImages.length - 1) {
                        setState(() {
                          currentImageIndex++;
                          _pageController.animateToPage(
                            currentImageIndex,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        });
                      }
                    }
                  },
                  child: SizedBox(
                    width: 400.0,
                    height: 400.0,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: carImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          carImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 0.0,
              spreadRadius: 0.7,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Cars'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Contact'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSwipeAlert(BuildContext context, String alertText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(alertText),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}