import 'package:flutter/material.dart';
import 'MainPage.dart'; // Adjust import based on your project structure

class VideoSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Video'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
          child: Text('Play Video'),
        ),
      ),
    );
  }
}
