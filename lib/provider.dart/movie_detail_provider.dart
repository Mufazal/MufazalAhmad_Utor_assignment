import 'package:flutter/cupertino.dart';
import 'package:utor_assignment/controller/get_movie_list.dart';
import 'package:utor_assignment/objects/movie_detail.dart';
import 'package:utor_assignment/objects/movie_list_object.dart';
import 'package:utor_assignment/utils/utils.dart';

class MovieDetailProvider extends ChangeNotifier {
  MovieDetail model;
  bool isConnected;

  getMovieDetail(int id) async {
    // notifyListeners();
    Utils.checkInternetConnectivity().then((value) async {
      if (value) {
        model = await Controller.getMovieDetail(id);
        notifyListeners();
      } else {
        isConnected = false;
        notifyListeners();
      }
    });
  }
}
