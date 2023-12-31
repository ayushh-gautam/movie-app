// ignore_for_file: avoid_print

import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/repo/api.dart';
import 'package:movie_app/models/usecase/cast_model.dart';

class MovieService {
  final Api _api = Api();
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
    return null;
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
    return null;
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
    return null;
  }

  Future<Cast?> getCast(int movieId) async {
    try {
      final response = await _api.sendResponse.get('movie/$movieId/credits');
      if (response.statusCode == 200) {
        final data = Cast.fromJson(response.data);
        return data;
      } else {
        print('Error in getting cast: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getting movie cast:$e');
    }
    return null;
  }
}
