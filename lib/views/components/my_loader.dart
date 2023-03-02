import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 50, width: 50, child: CircularProgressIndicator()));
  }
}
