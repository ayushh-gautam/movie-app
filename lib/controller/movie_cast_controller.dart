// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:movie_app/models/usecase/cast_model.dart';
import 'package:movie_app/models/usecase/movie_service.dart';

class MovieCastController extends GetxController {
  Cast? movieCast;

  bool isLoaded = false;

  List<CastElement> movieCastData = [];

  Future<void> fetchMovieCast(int id) async {
    isLoaded = true;
    Cast? result = await MovieService().getCast(id);
    movieCast = result;
    update();
  }
}
