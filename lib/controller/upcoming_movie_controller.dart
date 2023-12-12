import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/usecase/movie_service.dart';

class UpcomingMoviesController extends GetxController {
  Rx<Movie?> upcomingMovies = Rx<Movie?>(null);

  List<Result> upcomingMovieData = [];
  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
  }

  Future<void> fetchUpcomingMovies() async {
    Movie? result = await MovieService().getUpcomingMovies();
    upcomingMovies.value = result;
    upcomingMovieData.addAll(upcomingMovies.value!.results!);
  }
}
