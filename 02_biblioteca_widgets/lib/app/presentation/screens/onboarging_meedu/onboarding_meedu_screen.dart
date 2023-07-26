import 'package:animate_do/animate_do.dart';
import 'package:biblioteca_widgets/app/domain/models/slider_item_model.dart';
import 'package:biblioteca_widgets/app/presentation/shared_widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import 'controllers/onboarding_meedu_controller.dart';

final onboardingProvider = SimpleProvider(
  (ref) => OnboardingController(),
);

class OnboardingMeeduScreen extends StatelessWidget {
  const OnboardingMeeduScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = onboardingProvider.read;

    final pageController = controller.pageViewController;
    pageController.addListener(controller.onPageChanged);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: sliders
                .map((slide) => SliderWidget(
                      slide: slide,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () {
                controller.endReached = false;
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Consumer(
              builder: (_, ref, __) {
                final endReached =
                    ref.watch(onboardingProvider.select((controller) => controller.endReached)).endReached;

                return endReached
                    ? FadeInRight(
                        from: 15,
                        delay: const Duration(milliseconds: 500),
                        child: FilledButton(
                          child: const Text("Empezar"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
