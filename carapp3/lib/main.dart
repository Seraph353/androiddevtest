import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Liams Cars',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liams Cars'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Liams Cars',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
        GestureDetector( 

              onHorizontalDragEnd: (details) { 

                  if (details.primaryVelocity! > 0) { 

                      _showSwipeAlert(context, 'Swiped Right'); 

                } else if (details.primaryVelocity! < 0) { 

                    _showSwipeAlert(context, 'Swiped Left'); 

                  } 

      },


            child: Image.asset(
              'assets/car1.jpg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
        )],
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