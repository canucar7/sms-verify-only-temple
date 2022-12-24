import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw_2/first_screen.dart';
import 'package:hw_2/guest_screen.dart';

final phoneNumber = Provider((ref) =>TextEditingController());

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  FirstScreen(),
    );
  }
}

