import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/network/network_service.dart';

import '../data/model/image_model.dart';

class AppController extends GetxController{
  final networkService = NetworkService();

  final List<ImageResult> imageList = RxList();
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;
  RxString searchKeyword = ''.obs;
  RxInt page = 1.obs;
  RxBool maxLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getImageList('bird');
    });
  }

  void getImageList(String keyword) async{
    if (maxLoaded.value) {
      return;
    }
    if (isLoading.value) {
      return;
    }
    isLoading.value = true;
    searchKeyword.value = keyword;
    print("Current Page is $page");
    try{
      Map<String, String> param = {
        'query': searchKeyword.value,
        'per_page': '30',
        'page': page.value.toString()
      };

      final response =await networkService.getDioMethod(param, '/search/photos');

      if(response.statusCode==200){
        isLoading.value = false;
        var imageResponse = ImageSearchResult.fromJson(response.data);
        if(imageResponse.results!=null && imageResponse.results!.isNotEmpty){
          page.value+=1;
          imageList.addAll(imageResponse.results!);
          errorMessage.value = '';
        }else{
          maxLoaded.value = true;
          errorMessage.value = 'Mo More Load!';
        }
      }else{
        isLoading.value = false;
        errorMessage.value = '${response.statusCode} Error';
      }

    }catch(e){
      isLoading.value = false;
      errorMessage.value = "No Internet Connection!";
    }
  }
}