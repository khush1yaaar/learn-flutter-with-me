import 'dart:math';

import 'package:dio/dio.dart';
import 'package:socials/Cubit/APIHandling(Ep-6)/data/Models/post_model.dart';

import '../API/api.dart';

class PostReposetory {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    }
    on DioException catch (e) {
      throw e.message.toString();
    }
  }
}