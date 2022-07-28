import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/constants/string_cons.dart';
import 'package:marengoo/views/home_view/home_view.dart';
import 'package:marengoo/widgets/text_widget.dart';
import 'package:get/get.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.dimen_14, vertical: Sizes.dimen_12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            elevation: 4.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minWidth: Sizes.dimen_80,
            height: Sizes.dimen_60,
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColor.bgColor,
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minWidth: Sizes.dimen_220,
            height: Sizes.dimen_60,
            onPressed: () {},
            color: AppColor.highlightColor,
            child: const TextWidget(
              title: StringCons.payment,
              color: AppColor.bgColor,
              size: Sizes.dimen_24,
              weight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
