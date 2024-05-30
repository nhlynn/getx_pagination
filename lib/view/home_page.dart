import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/app_controller.dart';
import '../widget/image_item_view_widget.dart';
import '../widget/loading_view_widget.dart';
import '../widget/no_data_view.dart';
import '../widget/no_internet_connection_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appController = Get.put(AppController());

  final imageListScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    imageListScrollController.addListener(() {
      if (imageListScrollController.position.pixels >=
          imageListScrollController.position.maxScrollExtent * 0.9) {
        appController.getImageList(appController.searchKeyword.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (appController.isLoading.value && appController.imageList.isEmpty) {
          return const Center(child: LoadingViewWidget());
        }
        if (appController.imageList.isEmpty &&
            appController.errorMessage.value.isNotEmpty) {
          return Center(
            child: NoInternetConnectionViewWidget(
              retry: () {
                appController.getImageList(appController.searchKeyword.value);
              },
              message: appController.errorMessage.value,
            ),
          );
        }
        return ListView.builder(
            controller: imageListScrollController,
            itemCount: appController.imageList.length + 1,
            itemBuilder: (context, index) {
              if (index == appController.imageList.length) {
                if (appController.isLoading.value) {
                  return const Center(
                    child: LoadingViewWidget(),
                  );
                }
                if (appController.errorMessage.value.isNotEmpty) {
                  return Center(
                    child:
                        NoDataView(message: appController.errorMessage.value),
                  );
                }
                return const SizedBox.shrink();
              }
              final image = appController.imageList[index];
              return ImageItemViewWidget(
                image: image,
              );
            });
      }),
    );
  }
}
