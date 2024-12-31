import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactForm(),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // Controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // Predefined email details
  final String subject = "Contact Form Submission";
  final String recipientEmail =
      "your_email@example.com"; // Replace with your email

  // Function to simulate email composition
  void _showEmailContent() {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    // Pre-filled email content
    final String emailContent = '''
    Subject: $subject
    To: $recipientEmail
    
    Name: $name
    Email: $email
    Message: $message
    ''';

    // Show the pre-filled email content in an AlertDialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pre-filled Email'),
        content: SingleChildScrollView(
          child: Text(emailContent),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Message'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showEmailContent,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
