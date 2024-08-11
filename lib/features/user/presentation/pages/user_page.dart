import 'package:filmo/core/constants/app_colors.dart';
import 'package:filmo/core/widgets/cards.dart';
import 'package:filmo/features/user/presentation/bloc/detail_user_bloc.dart';
import 'package:filmo/features/user/presentation/bloc/event/detail_user_event.dart';
import 'package:filmo/features/user/presentation/bloc/event/favorite_list_event.dart';
import 'package:filmo/features/user/presentation/bloc/event/watchlist_event.dart';
import 'package:filmo/features/user/presentation/bloc/favorite_list_bloc.dart';
import 'package:filmo/features/user/presentation/bloc/state/detail_user_state.dart';
import 'package:filmo/features/user/presentation/bloc/state/favorite_list_state.dart';
import 'package:filmo/features/user/presentation/bloc/state/watchlist_state.dart';
import 'package:filmo/features/user/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserPage extends StatelessWidget {
  final int id;
  const UserPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<DetailUserBloc>().add(LoadDetailUser(id: id));
    context.read<FavoriteListBloc>().add(LoadFavoriteList(id: id));
    context.read<WatchlistBloc>().add(LoadWatchlist(id: id));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 19.5.h,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 13.h,
                  decoration:
                      const BoxDecoration(color: AppColors.cardBackgroundColor),
                ),
                Positioned(
                  top: 7.h,
                  left: 7.w,
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: AppColors.backgroundColor,
                    child: CircleAvatar(
                      radius: 42.0,
                      backgroundImage: AssetImage('assets/images/avaa.png'),
                    ),
                  ),
                )
              ]),
            ),
            BlocBuilder<DetailUserBloc, DetailUserState>(
                builder: (context, state) {
              if (state is GetDetailUserSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, right: 7.w),
                      child: Text(
                        state.user.username,
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, right: 7.w),
                      child: Text(
                        state.user.nameShown,
                        style: TextStyle(
                            color: AppColors.fontColorWithOpacity,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
            Container(
              margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
              height: 2,
              width: double.infinity,
              color: AppColors.cardOutlineColor,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, bottom: 1.h),
              child: Text(
                "Watchlist Movies",
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
              if (state is GetWatchlistSuccess) {
                return LimitedBox(
                  maxHeight: 33.h,
                  maxWidth: 42.w,
                  child: ListView.builder(
                      itemCount: state.movies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MoviesVerticalCards(
                          marginLeft: (index == 0) ? 7 : 3,
                          movieTitle: state.movies[index].ellipsizeTitle,
                          imagePath: state.movies[index].imagePath,
                          idMovie: "",
                        );
                      }),
                );
              } else {
                return const SizedBox();
              }
            }),
            Padding(
              padding: EdgeInsets.only(left: 7.w, bottom: 1.h),
              child: Text(
                "Favorites Movies",
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            BlocBuilder<FavoriteListBloc, FavoriteListState>(
                builder: (context, state) {
              if (state is GetFavoriteListSuccess) {
                return LimitedBox(
                  maxHeight: 33.h,
                  maxWidth: 42.w,
                  child: ListView.builder(
                      itemCount: state.movies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MoviesVerticalCards(
                          marginLeft: (index == 0) ? 7 : 3,
                          movieTitle: state.movies[index].ellipsizeTitle,
                          imagePath: state.movies[index].imagePath,
                          idMovie: "",
                        );
                      }),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
