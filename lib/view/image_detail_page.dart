import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/image_model.dart';
import '../widget/loading_view_widget.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageResult image = Get.arguments;

    return Scaffold(
      body: CachedNetworkImage(
        imageUrl: image.urls?.full ?? '',
        imageBuilder: (context, imageProvider) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Text(
                image.createdAt ?? '',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
        placeholder: (context, url) => const Center(child: LoadingViewWidget()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
