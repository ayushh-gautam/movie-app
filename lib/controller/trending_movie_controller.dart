import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/usecase/movie_service.dart';

class TrendingMovieController extends GetxController {
  Rx<Movie?> trendingMovies = Rx<Movie?>(null);

  List<Result> trendingMoviedata = [];

  @override
  void onInit() {
    super.onInit();
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    Movie? result = await MovieService().getTrendingMovies();
    trendingMovies.value = result;
    trendingMoviedata.addAll(trendingMovies.value!.results!);
  }
}
