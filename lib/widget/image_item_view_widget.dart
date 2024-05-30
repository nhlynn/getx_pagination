import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/image_model.dart';
import 'network_image_view_widget.dart';

class ImageItemViewWidget extends StatelessWidget {
  const ImageItemViewWidget({super.key, required this.image});

  final ImageResult image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: InkWell(
        onTap: () {
          Get.toNamed('/image_detail', arguments: image);
        },
        child: Card(
          elevation: 10,
          child: NetworkImageViewWidget(
            imageUrl: image.urls?.small ?? '',
          ),
        ),
      ),
    );
  }
}
