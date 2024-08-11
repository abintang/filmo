import 'package:filmo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        elevation: 10,
        leading: IconButton(
          iconSize: 5.w,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
          color: AppColors.fontColor,
        ),
        backgroundColor: AppColors.cardBackgroundColor,
        shadowColor: AppColors.cardOutlineColor,
        centerTitle: true,
        title: Text(
          "Detail Movie",
          style: TextStyle(
              color: AppColors.fontColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w1280/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
                  height: 86.w,
                  width: 86.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 65.w,
                margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                child: Text(
                  "Deadpool & Wolverine",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              width: 86.w,
              margin: EdgeInsets.only(left: 7.w, right: 7.w),
              child: Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                      3,
                      (index) => IntrinsicWidth(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 0.5.h),
                              margin: EdgeInsets.only(bottom: 1.h, right: 2.w),
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  border: Border.all(
                                      color: AppColors.cardOutlineColor,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  (index == 2) ? "Science Fiction" : "Action",
                                  style: TextStyle(
                                      color: AppColors.fontColorWithOpacity,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 5.h,
                  margin: EdgeInsets.only(right: 2.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2, color: AppColors.cardOutlineColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rate_sharp,
                        color: AppColors.goldColor,
                        size: 5.w,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "7.9 Ratings",
                        style: TextStyle(
                            color: AppColors.fontColorWithOpacity,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 54.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2, color: AppColors.cardOutlineColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.rate_review,
                        color: AppColors.fontColorWithOpacity,
                        size: 5.w,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Rated by 1,000 People",
                        style: TextStyle(
                            color: AppColors.fontColorWithOpacity,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 2,
              decoration:
                  const BoxDecoration(color: AppColors.cardOutlineColor),
              margin: EdgeInsets.symmetric(vertical: 1.h),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 7.w,
              ),
              child: Text(
                "Overview",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Text(
                "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              decoration:
                  const BoxDecoration(color: AppColors.cardOutlineColor),
              margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, bottom: 1.h),
              child: Text(
                "Similar Movie",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 7.w, bottom: 1.h),
              width: 42.w,
              height: 29.5.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: AppColors.cardOutlineColor, width: 1)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w1280/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
                      height: 21.h,
                      width: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 4.5.h,
                    margin: EdgeInsets.only(top: 1.h),
                    child: Center(
                      child: Text(
                        "Deadpool vs Wolverineasas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
