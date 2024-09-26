import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    super.key,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleConditions: const [Condition.largerThan(name: TABLET)],
      child: Expanded(
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                MyCarrousel(
                  controller: controller,
                  constraints: constraints,
                ),
                TopBanner(boxConstraintsParent: constraints),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(),
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCarrousel extends StatelessWidget {
  const MyCarrousel(
      {super.key, required this.controller, required this.constraints});

  final PageController controller;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    List<String> myImages = [
      "assets/onboarding/flutterbird.jpg",
      "assets/onboarding/ROGXEVANGELION.png",
      "assets/onboarding/myWallpaper.jpg"
    ];

    return Positioned(
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Image.asset(
          myImages[index],
          fit: BoxFit.cover,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        ),
      ),
    );
  }
}

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
    required this.boxConstraintsParent,
  });

  final BoxConstraints boxConstraintsParent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
        width: boxConstraintsParent.maxWidth,
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "B R E T I F Y",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
              ),
              label: const Text("Ve a nuestro sitio web"),
            )
          ],
        ),
      ),
    );
  }
}
