import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/usecase/movie_service.dart';

class PopularMoviesController extends GetxController {
  Rx<Movie?> popularMovies = Rx<Movie?>(null);

  List<Result> popularMovieData = [];
  @override
  void onInit() {
    super.onInit();
    fetchPopularMovies();
  }

  Future<void> fetchPopularMovies() async {
    Movie? result = await MovieService().getPopularMovies();
    popularMovies.value = result;
    popularMovieData.addAll(popularMovies.value!.results!);
  }
}
