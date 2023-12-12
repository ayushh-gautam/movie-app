import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/repo/api.dart';

class MovieService {
  Api _api = Api();
  Future<Movie?> getTrendingMovies() async {
    try {
      final response = await _api.sendResponse.get('trending/movie/day');
      if (response.statusCode == 200) {
        final data = Movie.fromJson(response.data);
        return data;
      } else {
        print('Error in GetPopular: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in loading trending:$e');
    }
  }

  Future<Movie?> getPopularMovies() async {
    try {
      final response = await _api.sendResponse.get('movie/popular');
      if (response.statusCode == 200) {
        final data = Movie.fromJson(response.data);
        return data;
      } else {
        print('Error in GetPopular: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in loading popular:$e');
    }
  }

  Future<Movie?> getUpcomingMovies() async {
    try {
      final response = await _api.sendResponse.get('movie/upcoming');
      if (response.statusCode == 200) {
        final data = Movie.fromJson(response.data);
        return data;
      } else {
        print('Error in GetPopular: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in loading top rated:$e');
    }
  }
}
