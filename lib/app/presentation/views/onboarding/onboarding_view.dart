import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/cubit/user_cubit/user_cubit.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cubit/onboarding_cubit.dart';

class OnboardingViewArguments {
  final User user;
  OnboardingViewArguments({required this.user});
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
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
                      final nextPage = _currentPage + 1;
                      if (nextPage < onboardingPages.length) {
                        setState(() {
                          _currentPage = nextPage;
                        });

                        _pageController.animateToPage(
                          nextPage,
                          curve: Curves.fastOutSlowIn,
                          duration: Durations.extralong1,
                        );
                      } else {
                        final user = context.read<UserCubit>().state;
                        if (user != null) {
                          context.read<OnboardingCubit>().createUser(user);
                        }
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.pageView,
                          (route) => false,
                        );
                      }
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
