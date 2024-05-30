import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
