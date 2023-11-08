import 'package:email_app/model/email.dart';
import 'package:email_app/widget/email_widget.dart';
import 'package:flutter/material.dart';
import 'package:email_app/model/backend.dart';
import 'package:email_app/screens/DetailScreen.dart';

class ListScreen extends StatefulWidget {
  final List<Email> emails;

  ListScreen({required this.emails});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      widget.emails.removeWhere((email) => email.id == id);
    });
  }

  void markEmailAsRead(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      widget.emails.firstWhere((email) => email.id == id).read = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandeja de entrada'),
        backgroundColor: const Color.fromARGB(255, 84, 30, 233),
        titleTextStyle:
            TextStyle(color: Color.fromARGB(255, 228, 177, 177)Weight: FontWeight.bold),
        centerTitle: true,
      ),
      body: ListView(
        children: Backend()
            .getEmails()
            .map((Email) => EmailWidget(email: Email))
            .toList(),
        //.map((Email) => EmailWidget(email: Email)).toList(),
      ),
    );
  }
}
