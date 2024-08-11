import 'package:filmo/core/constants/api.dart';
import 'package:filmo/core/constants/app_colors.dart';
import 'package:filmo/core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class MoviesHorizontalCards extends StatelessWidget {
  final String movieTitle;
  final String ratings;
  final String releaseDate;
  final String imagePath;
  final String idMovie;
  final double marginLeft;

  /// [MoviesHorizontalCards] adalah widget yang digunakan untuk menampilkan cards
  /// movies dengan bentuk horizontal.
  const MoviesHorizontalCards(
      {super.key,
      required this.idMovie,
      required this.imagePath,
      required this.movieTitle,
      required this.ratings,
      required this.releaseDate,
      required this.marginLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 24.5.h,
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
      decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(left: marginLeft.w, right: 1.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 36.w,
                child: Text(
                  movieTitle,
                  style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 3.5.h,
                    width: 13.w,
                    margin: EdgeInsets.only(top: 1.h, right: 1.w),
                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          size: 4.w,
                          color: AppColors.goldColor,
                        ),
                        Text(
                          ratings,
                          style: TextStyle(
                              color: AppColors.fontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    height: 3.5.h,
                    width: 22.w,
                    margin: EdgeInsets.only(top: 1.h),
                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        releaseDate,
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                height: 2,
                width: 36.w,
                color: AppColors.cardOutlineColor,
              ),
              ButtonWithIcon(
                  outlineColor: AppColors.primaryColor,
                  textIconColor: AppColors.primaryColor,
                  backgroundColorButton: Colors.transparent,
                  textButton: 'Add to Watchlist',
                  iconButton: Icons.watch_later_rounded,
                  onTapButton: () {},
                  width: 36,
                  height: 3.5,
                  fontSize: 14,
                  iconSize: 4.5),
              SizedBox(
                height: 1.h,
              ),
              ButtonWithIcon(
                  outlineColor: AppColors.primaryColor,
                  textIconColor: AppColors.primaryColor,
                  backgroundColorButton: Colors.transparent,
                  textButton: 'Add to Favorite',
                  iconButton: Icons.favorite,
                  onTapButton: () {},
                  width: 36,
                  height: 3.5,
                  fontSize: 14,
                  iconSize: 4.5)
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              Api.imagePath + imagePath,
              height: 20.h,
              width: 30.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class MoviesVerticalCards extends StatelessWidget {
  final String movieTitle;
  final String imagePath;
  final String idMovie;
  final double marginLeft;

  /// [MoviesVerticalCards] adalah widget yang digunakan untuk menampilkan cards
  /// movies dengan bentuk vertical.
  const MoviesVerticalCards(
      {super.key,
      required this.movieTitle,
      required this.imagePath,
      required this.idMovie,
      required this.marginLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft.w, bottom: 1.h),
      width: 42.w,
      height: 33.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.cardOutlineColor, width: 1)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              Api.imagePath + imagePath,
              height: 21.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 4.5.h,
            child: Center(
              child: Text(
                movieTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ),
          ),
          ButtonWithIcon(
              outlineColor: AppColors.primaryColor,
              textIconColor: AppColors.fontColor,
              backgroundColorButton: AppColors.primaryColor,
              textButton: "Remove Rrom List",
              iconButton: Icons.remove_circle,
              onTapButton: () {},
              width: 40,
              height: 3.5,
              fontSize: 14,
              iconSize: 4.5)
        ],
      ),
    );
  }
}

class LoadingMoviesHorizontalCards extends StatelessWidget {
  final double marginLeft;

  /// [LoadingMoviesHorizontalCards] adalah widget yang digunakan untuk
  ///  menampilkan loading cards movies dengan bentuk horizontal.
  const LoadingMoviesHorizontalCards({super.key, required this.marginLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80.w,
        height: 24.5.h,
        padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: marginLeft.w),
        child: Shimmer.fromColors(
            baseColor: AppColors.cardBackgroundColor,
            highlightColor: AppColors.primaryColor.withOpacity(0.2),
            child: Container(
              width: 88.w,
              height: 24.5.h,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5)),
            )));
  }
}

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 34.h,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 4.w),
              width: 42.w,
              height: 34.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColors.cardOutlineColor, width: 1)),
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 21.h,
                      margin: EdgeInsets.only(bottom: 1.h),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 4.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.cardBackgroundColor),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.cardBackgroundColor,
                    highlightColor: AppColors.primaryColor.withOpacity(0.2),
                    child: Container(
                      height: 3.5.h,
                      margin: EdgeInsets.only(top: 1.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.cardBackgroundColor),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
