import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:filmo/features/auth/data/data_sources/auth_remote_datasources.dart';
import 'package:filmo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:filmo/features/auth/domain/repositories/auth_repository.dart';
import 'package:filmo/features/auth/domain/usecases/auth_user.dart';
import 'package:filmo/features/detail_movie/data/data_source/detail_movie_remote_datasource.dart';
import 'package:filmo/features/detail_movie/data/repositories/detail_movies_repository_impl.dart';
import 'package:filmo/features/detail_movie/domain/repositories/detail_movies_repository.dart';
import 'package:filmo/features/detail_movie/domain/usecase/get_detail_movies.dart';
import 'package:filmo/features/home/data/data_sources/now_playing_remote_datasources.dart';
import 'package:filmo/features/home/data/data_sources/popular_remote_datasources.dart';
import 'package:filmo/features/home/data/repository/now_playing_repository_impl.dart';
import 'package:filmo/features/home/data/repository/popular_repository_impl.dart';
import 'package:filmo/features/home/domain/repository/now_playing_repository.dart';
import 'package:filmo/features/home/domain/repository/popular_repository.dart';
import 'package:filmo/features/home/domain/usecase/get_now_playing.dart';
import 'package:filmo/features/home/domain/usecase/get_popular_movies.dart';
import 'package:filmo/features/user/data/data_sources/detail_user_remote_datasource.dart';
import 'package:filmo/features/user/data/data_sources/favorite_list_remote_datasources.dart';
import 'package:filmo/features/user/data/data_sources/watchlist_remote_datasources.dart';
import 'package:filmo/features/user/data/repository/detail_user_repository_impl.dart';
import 'package:filmo/features/user/data/repository/favorite_list_repository_impl.dart';
import 'package:filmo/features/user/data/repository/watchlist_repository_impl.dart';
import 'package:filmo/features/user/domain/repository/detail_user_repository.dart';
import 'package:filmo/features/user/domain/repository/favorite_list_repository.dart';
import 'package:filmo/features/user/domain/repository/watchlist_repository.dart';
import 'package:filmo/features/user/domain/usecase/get_detail_user.dart';
import 'package:filmo/features/user/domain/usecase/get_favorite_list.dart';
import 'package:filmo/features/user/domain/usecase/get_watchlist.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void configure() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // DI Auth
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences));
  getIt.registerLazySingleton<AuthRemoteDataSources>(() =>
      AuthRemoteDataSourcesImpl(localDataSource: getIt<AuthLocalDataSource>()));
  getIt.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(remoteDataSource: getIt<AuthRemoteDataSources>()));
  getIt.registerLazySingleton<AuthUser>(
      () => AuthUser(authRepository: getIt<AuthRepository>()));

  // DI Now Playing [Home]
  getIt.registerLazySingleton<NowPlayingRemoteDataSources>(
      () => NowPlayingRemoteDataSourcesImpl());
  getIt.registerLazySingleton<NowPlayingRepository>(() =>
      NowPlayingRepositoryImpl(
          nowPlayingRemoteDataSources: getIt<NowPlayingRemoteDataSources>()));
  getIt.registerLazySingleton<GetNowPlaying>(
      () => GetNowPlaying(nowPlayingRepository: getIt<NowPlayingRepository>()));

  // DI Popular Movies [Home]
  getIt.registerLazySingleton<PopularRemoteDataSources>(
      () => PopularRemoteDataSourcesImpl());
  getIt.registerLazySingleton<PopularMoviesRepository>(() =>
      PopularMoviesRepositoryImpl(
          popularRemoteDataSources: getIt<PopularRemoteDataSources>()));
  getIt.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies(
      popularMoviesRepository: getIt<PopularMoviesRepository>()));

  // DI Detail User
  getIt.registerLazySingleton<DetailUserRemoteDataSource>(
      () => DetailUserRemoteDataSourceImpl());
  getIt.registerLazySingleton<DetailUserRepository>(() =>
      DetailUserRepositoryImpl(
          remoteDataSource: getIt<DetailUserRemoteDataSource>()));
  getIt.registerLazySingleton<GetDetailUser>(
      () => GetDetailUser(detailUserRepository: getIt<DetailUserRepository>()));

  // DI Watchlist
  getIt.registerLazySingleton<WatchlistRemoteDataSource>(
      () => WatchlistRemoteDataSourceImpl());
  getIt.registerLazySingleton<WatchlistRepository>(() =>
      WatchlistRepositoryImpl(
          watchlistRemoteDataSource: getIt<WatchlistRemoteDataSource>()));
  getIt.registerLazySingleton<GetWatchlist>(
      () => GetWatchlist(watchlistRepository: getIt<WatchlistRepository>()));

  // DI Favoritelist
  getIt.registerLazySingleton<FavoriteListRemoteDataSources>(
      () => FavoriteListRemoteDataSourcesImpl());
  getIt.registerLazySingleton<FavoriteListRepository>(() =>
      FavoriteListRepositoryImpl(
          favoriteListRemoteDataSources:
              getIt<FavoriteListRemoteDataSources>()));
  getIt.registerLazySingleton<GetFavoriteList>(() =>
      GetFavoriteList(favoriteListRepository: getIt<FavoriteListRepository>()));

  // DI Detail Movies
  getIt.registerLazySingleton<DetailMovieRemoteDataSources>(
      () => DetailMovieRemoteDataSourcesImpl());
  getIt.registerLazySingleton<DetailMoviesRepository>(() =>
      DetailMoviesRepositoryImpl(
          detailMovieRemoteDataSources: getIt<DetailMovieRemoteDataSources>()));
  getIt.registerLazySingleton<GetDetailMovies>(() =>
      GetDetailMovies(detailMoviesRepository: getIt<DetailMoviesRepository>()));
}
