import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/pages/choise_initiative_page.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/pages/reap_reward_page.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/pages/take_action_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  // ignore: unused_field
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPages = [
      _buildPage(const ChoiseInitiativePage()),
      _buildPage(const TakeActionPage()),
      _buildPage(const ReapRewardPage()),
    ];

    return AlboradaScaffoldWidget(
      scrollPhysics: const NeverScrollableScrollPhysics(),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.9,
            child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return onboardingPages[index];
                }),
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.09,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: onboardingPages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 20,
                      expansionFactor: 2,
                      activeDotColor: Color(0xfffEC574),
                      dotColor: Color(0xfffCD586),
                    ),
                  ),
                  SizedBox(height: 10),
                  SimpleButton(
                    isDarkButton: true,
                    text: _currentPage == 2 ? 'C’est compris!' : 'Suivant',
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        _pageController.animateToPage(
                          0,
                          duration: Durations.extralong3,
                          curve: Curves.easeInOut,
                        );
                        return;
                      }
                      _pageController.nextPage(
                        duration: Durations.extralong3,
                        curve: Cubic(0.68, -0.55, 0.27, 1.55),
                      );
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildPage(Widget page) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - _currentPage;
          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
        }
        return Transform(
          transform: Matrix4.identity()..translate(0.0, 5 * (1 - value)),
          child: Opacity(opacity: value, child: page),
        );
      },
    );
  }
}
