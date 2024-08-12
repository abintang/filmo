import 'package:filmo/core/widgets/cards.dart';
import 'package:filmo/features/home/presentation/bloc/action_on_movie_bloc.dart';
import 'package:filmo/features/home/presentation/bloc/event/action_on_movie_event.dart.dart';
import 'package:filmo/features/home/presentation/bloc/event/now_playing_event.dart';
import 'package:filmo/features/home/presentation/bloc/event/popular_movies_event.dart';
import 'package:filmo/features/home/presentation/bloc/now_playing_bloc.dart';
import 'package:filmo/features/home/presentation/bloc/popular_movies_bloc.dart';
import 'package:filmo/features/home/presentation/bloc/state/now_playing_state.dart';
import 'package:filmo/features/home/presentation/bloc/state/popular_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:filmo/core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  final int id;
  const HomePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<NowPlayingBloc>().add(LoadNowPlaying());
    context.read<PopularMoviesBloc>().add(LoadPopularMovies());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 7.w, top: 2.h, bottom: 2.h),
            child: Text(
              "Now Playing",
              style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          BlocBuilder<NowPlayingBloc, NowPlayingState>(
              builder: (context, state) {
            if (state is LoadingState) {
              return LimitedBox(
                maxHeight: 24.5.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return LoadingMoviesHorizontalCards(
                        marginLeft: (index == 0) ? 7 : 3,
                      );
                    }),
              );
            } else if (state is GetNowPlayingSuccess) {
              return LimitedBox(
                  maxHeight: 24.5.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MoviesHorizontalCards(
                        idMovie: state.movies[index].id.toString(),
                        imagePath: state.movies[index].imagePath,
                        movieTitle: state.movies[index].ellipsizeTitle,
                        ratings: state.movies[index].ratingLen,
                        releaseDate: state.movies[index].releaseDate,
                        marginLeft: (index == 0) ? 7 : 3,
                        onAddFavorite: () {
                          context.read<ActionOnMovieBloc>().add(
                              AddListMovieEvent(
                                  accountId: id,
                                  movieId: state.movies[index].id,
                                  saveType: "favorite"));
                        },
                        onAddWatchlist: () {
                          context.read<ActionOnMovieBloc>().add(
                              AddListMovieEvent(
                                  accountId: id,
                                  movieId: state.movies[index].id,
                                  saveType: "watchlist"));
                        },
                      );
                    },
                  ));
            } else {
              return const SizedBox();
            }
          }),
          Padding(
            padding: EdgeInsets.only(left: 7.w, top: 2.h, bottom: 2.h),
            child: Text(
              "Popular",
              style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
            if (state is LoadingPopularState) {
              return LimitedBox(
                maxHeight: 24.5.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return LoadingMoviesHorizontalCards(
                        marginLeft: (index == 0) ? 7 : 3,
                      );
                    }),
              );
            } else if (state is GetPopularMoviesSuccess) {
              return LimitedBox(
                  maxHeight: 24.5.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return MoviesHorizontalCards(
                        idMovie: state.movies[index].id.toString(),
                        imagePath: state.movies[index].imagePath,
                        movieTitle: state.movies[index].ellipsizeTitle,
                        ratings: state.movies[index].ratingLen,
                        releaseDate: state.movies[index].releaseDate,
                        marginLeft: (index == 0) ? 7 : 3,
                        onAddFavorite: () {
                          context.read<ActionOnMovieBloc>().add(
                              AddListMovieEvent(
                                  accountId: id,
                                  movieId: state.movies[index].id,
                                  saveType: "favorite"));
                        },
                        onAddWatchlist: () {
                          context.read<ActionOnMovieBloc>().add(
                              AddListMovieEvent(
                                  accountId: id,
                                  movieId: state.movies[index].id,
                                  saveType: "watchlist"));
                        },
                      );
                    },
                  ));
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
