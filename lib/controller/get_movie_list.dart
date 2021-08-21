import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:utor_assignment/constant/const.dart';
import 'package:utor_assignment/objects/movie_detail.dart';
import 'package:utor_assignment/objects/movie_list_object.dart';
import 'package:utor_assignment/ui/movie_detail.dart';

class Controller {
  static getMoviesList() async {
    // Dio dio = Dio();
    Uri uri = Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=e56324eb64be2598f800deb3d2e71bf7");
    var response = await http
        .get(
      uri,
    )
        .catchError((e) {
      print("Error get Data");
    });

    print(response.statusCode);

    print(response.body.toString());

    if (response.statusCode == 200) {
      if (response.statusCode != null) {
        return MovieList.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    }
  }

  static getMovieDetail(int movieID) async {
    // Dio dio = Dio();
    Uri uri = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieID?api_key=${Constants.API_KEY}");
    var response = await http
        .get(
      uri,
    )
        .catchError((e) {
      print("Error get Data");
    });

    print(response.statusCode);

    print(response.body.toString());

    if (response.statusCode == 200) {
      if (response.statusCode != null) {
        return MovieDetail.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    }
  }
}
