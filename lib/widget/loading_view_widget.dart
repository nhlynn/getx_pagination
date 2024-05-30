import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingViewWidget extends StatelessWidget {
  const LoadingViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.flickr(
      leftDotColor: Colors.blueGrey,
      rightDotColor: Colors.lightBlue,
      size: 20,
    );
  }
}
