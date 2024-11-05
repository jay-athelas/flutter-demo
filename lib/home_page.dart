import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  void _showTextInput(BuildContext context) {
    final enteredText = _textController.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Entered Text"),
        content: Text(enteredText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    // Navigate back to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: "Logout",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Enter some text"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showTextInput(context),
              child: Text("Show Text"),
            ),
          ],
        ),
      ),
    );
  }
}
