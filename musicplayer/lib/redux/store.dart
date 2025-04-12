import 'package:redux/redux.dart';
import '../models/movie.dart';
import 'reducers.dart';

final appStore = Store<List<Movie>>(
  moviesReducer,
  initialState: [],
);