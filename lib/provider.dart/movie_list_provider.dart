import 'package:flutter/cupertino.dart';
import 'package:utor_assignment/controller/get_movie_list.dart';
import 'package:utor_assignment/objects/movie_list_object.dart';
import 'package:utor_assignment/utils/utils.dart';

class MovieListProvider extends ChangeNotifier {
  MovieList model;
  bool isConnected;
  bool loading;
  getMovies() async {
    // notifyListeners();
    loading = false;
    Utils.checkInternetConnectivity().then((value) async {
      print(value);
      if (value) {
        model = await Controller.getMoviesList();
        notifyListeners();
      } else {
        isConnected = false;
        notifyListeners();
      }
    });
  }
}
