import 'package:movie_app/models/usecase/popular_movie.dart';
import 'package:movie_app/repo/api.dart';

class GetPopular {
  Api _api = Api();

  Future<PopularMovie?> getPopularMovies() async {
    try {
      final response = await _api.sendResponse.get('movie/popular');
      if (response.statusCode == 200) {
        final data = PopularMovie.fromJson(response.data);
        print(data.results);

        return data;
      } else {
        print('Error in GetPopular: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in GetPopular: $e');
    }
  }
}
