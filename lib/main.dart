import 'package:email_app/screens/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:email_app/model/email.dart';
import 'package:email_app/model/backend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final backend = Backend();
    final List<Email> emails = backend.getEmails();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListScreen(emails: emails),
    );
  }
}



