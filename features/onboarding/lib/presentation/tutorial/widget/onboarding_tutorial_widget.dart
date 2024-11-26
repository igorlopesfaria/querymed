import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:commons_navigation/route/common_routes.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/slide_indicator/slide_indicator.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_onboarding/presentation/tutorial/bloc/onboarding_turorial_cubit.dart';
import 'package:features_onboarding/presentation/tutorial/bloc/onboarding_tutorial_state.dart';
import 'package:features_onboarding/presentation/tutorial/string/onboarding_tutorial_string.dart';
import 'package:features_onboarding/presentation/tutorial/widget/onboarding_tutorial_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class OnboardingTutorialWidget extends StatefulWidget {
  const OnboardingTutorialWidget({super.key});

  @override
  State<OnboardingTutorialWidget> createState() => _OnboardingTutorialWidget();
}

class _OnboardingTutorialWidget extends State<OnboardingTutorialWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  final OnboardingTutorialCubit cubit = GetIt.I.get<OnboardingTutorialCubit>();
  final token = DSTokenProvider().provide();

  int page = 0;

  void setCurrentPage(int index) {
    setState(() {
      page = index;
    });
    tabController.animateTo(index);
  }

  @override
  void initState() {
    super.initState();
    cubit.initValues();
    tabController = TabController(length: cubit.totalPage, vsync: this);
  }

  void callbackFunction(int index) {
    setCurrentPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: token.color.surface,
        body: BlocProvider.value(
            value: cubit,
            child:
                BlocConsumer<OnboardingTutorialCubit, OnboardingTutorialState>(
                    listener: (BuildContext context, state) {
              if (state is OnboardingTutorialFinished) {
                CommonNavigator.pushReplacementNamed(
                    context, CommonRoutes.onboardingInitialRoute);
              }
            }, builder: (context, state) {
              return SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: page != 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: token.spacing.sm, right: token.spacing.xs),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text.rich(TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                cubit.finishTutorial();
                              },
                            text: OnboardingTutorialStrings.skip,
                            style: TextStyle(
                                color: token.color.surfaceOutlineHigh,
                                fontFamily: token.text.t14Regular.fontFamily,
                                fontSize: token.text.t14Regular.fontSize,
                                fontWeight: token.text.t14Regular.fontWeight))),
                      ),
                    ),
                  ),
                  Expanded(
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 1),
                          itemCount: cubit.totalPage,
                          onPageChanged: callbackFunction,
                          itemBuilder: (BuildContext context, int index) {
                            return OnboardingTutorialItemWidget(
                              imagePath: cubit.images[index],
                              title: cubit.titles[index],
                            );
                          })),
                  Padding(
                    padding: EdgeInsets.only(bottom: token.spacing.xs),
                    child: Align(
                      alignment: Alignment.center,
                      child: DSSlideIndicatorWidget(
                        currentPage: page,
                        totalPages: cubit.totalPage,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: token.spacing.sm, right: token.spacing.sm),
                      child: DSButtonWidget(
                        type: DSButtonType.primary,
                        showLoading: state is OnboardingTutorialLoadingState,
                        state: page + 1 == cubit.totalPage
                            ? DSButtonState.enabled
                            : DSButtonState.disabled,
                        onPressed: () => {
                          cubit.finishTutorial()
                          // EscalaNavigator.pushNamed(context, EscalaRoutes.localListRoute)
                        },
                        iconData: Icons.done,
                      ),
                    ),
                  ),
                ],
              ));
            })));
  }
}
