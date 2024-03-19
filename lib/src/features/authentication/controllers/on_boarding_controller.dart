import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/on_boarding_model.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
            bgColor: SolarSenseColors.onBoardingPage1Color,
            image: onBoardingImage1,
            //height: size.height,
            title: onBoardingTitle1,
            subTitle: onBoardingSubTitle1,
            counterText: onBoardingCounter1
        )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            bgColor: SolarSenseColors.onBoardingPage2Color,
            image: onBoardingImage2,
            //height: size.height,
            title: onBoardingTitle2,
            subTitle: onBoardingSubTitle2,
            counterText: onBoardingCounter2
        )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            bgColor: SolarSenseColors.onBoardingPage3Color,
            image: onBoardingImage3,
            //height: size.height,
            title: onBoardingTitle3,
            subTitle: onBoardingSubTitle3,
            counterText: onBoardingCounter3
        )
    ),
  ];

  onPageChangeCallback(int activePageIndex) => currentPage.value = activePageIndex;

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangedCallback(int activePageIndex) => currentPage.value = activePageIndex;
}