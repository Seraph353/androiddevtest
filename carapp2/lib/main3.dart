import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Find A Gift',
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
    'assets/gift.png',
    
    // Add more image paths as needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // your existing code for the HomePage
    );
  }
}

// Place the LiveForms class here
class LiveForms extends StatelessWidget {
  const LiveForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Forms'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Form 1'),
              subtitle: const Text('Description of Form 1'),
              onTap: () {
                // Navigate to form details page
              },
            ),
            ListTile(
              title: const Text('Form 2'),
              subtitle: const Text('Description of Form 2'),
              onTap: () {
                // Navigate to form details page
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
    );
  }
}
