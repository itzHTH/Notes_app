import 'package:flutter/material.dart';
import 'package:notes_app/cache/shared.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/views/home_view.dart';
import 'package:notes_app/views/screens/screen1.dart';
import 'package:notes_app/views/screens/screen2.dart';
import 'package:notes_app/views/screens/screen3.dart';
import 'package:notes_app/views/screens/screen4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static String id = "OnboardingView";

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();

  String nextButtonText = "Next";
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (page) {
            if (page == 3) {
              nextButtonText = "Finish";
              isLastPage = true;
              setState(() {});
            } else {
              nextButtonText = "Next";
              isLastPage = false;
              setState(() {});
            }
          },
          children: const [Screen1(), Screen2(), Screen3(), Screen4()],
        ),
        Align(
          alignment: const Alignment(0, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isLastPage
                  ? const SizedBox(
                      width: 44,
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.animateToPage(3,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: const JumpingDotEffect(
                        // dotColor: Colors.white,
                        activeDotColor: kPrimaryColor,
                        verticalOffset: 16)),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.page == 3) {
                    Navigator.pushReplacementNamed(context, HomeView.id);
                    SharedPref.setBool(key: "isOld", bool: true);
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  }
                },
                child: Text(
                  nextButtonText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
