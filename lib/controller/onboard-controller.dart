import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_translation/utils/images.dart';

import '../models/onboard-model.dart';

class OnboardController extends Cubit{
  OnboardController() : super(0);
  PageController pageController = PageController();

  int pageIndex = 0;

  final List<OnBoard> onboardData = [
    OnBoard(
      image: AppImages.ONBOARD_1,
      // title: "Title 01",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoard(
      image: AppImages.ONBOARD_2,
      // title: "Title 02",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
    OnBoard(
      image: AppImages.ONBOARD_3,
      // title: "Title 03",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

}

