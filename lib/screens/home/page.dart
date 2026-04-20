import 'package:flutter/material.dart';

class Textpage extends StatelessWidget{
  const Textpage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 214, 214),
      body: SafeArea(
        child: Column(
          children: [

            Text(
              'Navya Rastogi',
            ),
            Text(
              'Bulandshahr',
              
            ),
          ],
        ),
      ),
    );
  }
}