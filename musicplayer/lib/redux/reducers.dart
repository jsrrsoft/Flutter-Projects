import 'package:redux/redux.dart';
import '../models/movie.dart';
import 'actions.dart';

final moviesReducer = combineReducers<List<Movie>>([
  TypedReducer<List<Movie>, SetMoviesAction>(_setMovies),
]);

List<Movie> _setMovies(List<Movie> state, SetMoviesAction action) {
  return action.movies;
}