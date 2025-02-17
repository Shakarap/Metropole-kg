import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metropole/app/constants/app.colors.dart';
import 'package:metropole/core/notifiers/size.notifier.dart';
import 'package:metropole/presentation/widgets/custom.text.style.dart';

Widget selectSize({required bool themeFlag, required BuildContext context}) {
  SizeNotifier sizeNotifier(bool renderUI) =>
      Provider.of<SizeNotifier>(context, listen: renderUI);
  return ListView(scrollDirection: Axis.horizontal, children: [
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeEight();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "39",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeEight
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeNine();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "40",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeNine
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeTen();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "41",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeTen
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeEleven();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "43",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeEleven
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  ]);
}
