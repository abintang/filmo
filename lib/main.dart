import 'package:filmo/core/constants/app_colors.dart';
import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/presentation/bloc/login_bloc.dart';
import 'package:filmo/features/auth/presentation/page/login_page.dart';
import 'package:filmo/features/detail_movie/presentation/page/detail_movie_page.dart';
import 'package:filmo/features/home/presentation/bloc/now_playing_bloc.dart';
import 'package:filmo/features/home/presentation/bloc/popular_movies_bloc.dart';
import 'package:filmo/features/user/presentation/bloc/detail_user_bloc.dart';
import 'package:filmo/features/user/presentation/bloc/favorite_list_bloc.dart';
import 'package:filmo/features/user/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configure();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginBloc()),
            BlocProvider(create: (context) => NowPlayingBloc()),
            BlocProvider(create: (context) => PopularMoviesBloc()),
            BlocProvider(create: (context) => DetailUserBloc()),
            BlocProvider(create: (context) => FavoriteListBloc()),
            BlocProvider(create: (context) => WatchlistBloc()),
          ],
          child: MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: AppColors.backgroundColor,
                fontFamily: 'Manrope'),
            home: const DetailMoviePage(),
          ),
        );
      },
    );
  }
}
