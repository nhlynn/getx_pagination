import 'package:flutter/material.dart';

class NoInternetConnectionViewWidget extends StatelessWidget {
  const NoInternetConnectionViewWidget(
      {super.key, required this.message, required this.retry});

  final String message;
  final Function() retry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        FilledButton(
            onPressed: retry,
            child: const Text(
              'Retry',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
