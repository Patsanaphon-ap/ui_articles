import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:ui_articles/src/data/constants/app_const.dart';
import 'package:ui_articles/src/data/model/articles_model.dart';

abstract class ArticlesRemote {
  Future<Result<List<ArticlesModel>, String>> getArticle(
      {required String article});
}

class ArticlesRemoteDateImp extends ArticlesRemote {
  final dio = Dio();

  @override
  Future<Result<List<ArticlesModel>, String>> getArticle(
      {required String article}) async {
    try {
      //call api to google-news for article data
      final resp = await dio.get(
        'https://google-news13.p.rapidapi.com/$article?lr=en-US',
        options: Options(
          headers: {
            'x-rapidapi-key': AppConst.rapidApi,
          },
        ),
      );
      if (resp.statusCode == 200) {
        //response success to controller
        return Success(
          List<ArticlesModel>.from(
            resp.data['items'].map(
              (e) => ArticlesModel.fromJson(e),
            ),
          ),
        );
      } else if (resp.statusCode == 429) {
        return Error(resp.statusMessage.toString());
      } else {
        //response back to controller or do some thing first
        return Error(resp.statusCode.toString());
      }
    } on DioException catch (e) {
      //when it meet limit
      if (e.response?.statusCode == 429) {
        Get.snackbar(
          'Error',
          'Error: ${e.response?.statusCode} - ${e.response?.statusMessage}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return const Error("Handle API request limits");
      }
      return Error(e.message.toString());
    }
  }
}
