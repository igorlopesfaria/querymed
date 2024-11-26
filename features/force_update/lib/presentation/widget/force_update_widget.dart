import 'package:commons_core/animation/custom_animation.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:features_force_update/presentation/bloc/force_update_cubit.dart';
import 'package:features_force_update/presentation/bloc/force_update_state.dart';
import 'package:features_force_update/presentation/string/force_update_string.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class ForceUpdateWidget extends StatefulWidget {
  const ForceUpdateWidget({super.key, required this.clickHelpIcon});

  final void Function(BuildContext) clickHelpIcon;

  @override
  State<ForceUpdateWidget> createState() => _ForceUpdateWidget();
}

class _ForceUpdateWidget extends State<ForceUpdateWidget>  with TickerProviderStateMixin{
  final ForceUpdateCubit cubit = GetIt.I.get<ForceUpdateCubit>();
  final token = DSTokenProvider().provide();
  late final AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: token.color.surface,
          appBar: DSAppBarWidget(
            type: DSAppBarType.light,
            menuItem: Icons.support_agent,
            onPressedMenuItem: () => {widget.clickHelpIcon(context)},
          ),
          body: BlocProvider.value(
            value: cubit,
            child: BlocConsumer<ForceUpdateCubit, ForceUpdateState>(
              listener: (BuildContext context, state) {},
              builder: (context, state) {
                return SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center, // Alinha ao centro no eixo horizontal
                              mainAxisAlignment: MainAxisAlignment.center, // Centraliza no eixo vertical
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    child: Lottie.asset(
                                      token.assets.animForceUpdate,
                                      decoder: customDecoder,
                                      controller: _controller,
                                      height: 250,
                                      fit: BoxFit.fill,
                                      onLoaded: (composition) {
                                        _controller
                                          ..duration = composition.duration
                                          ..forward()
                                          ..repeat();
                                      },
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: token.spacing.xs)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: token.spacing.sm),
                                  child: DSTextWidget(
                                    text: ForceUpdateStrings.title,
                                    textAlign: TextAlign.center, // Centraliza o texto
                                    typographyColor: token.color.onSurfaceHigh,
                                    typographyStyle: DSTypographyStyleType.t24Medium,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: token.spacing.xxs)),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: token.spacing.sm),
                                  child: DSTextWidget(
                                    text: ForceUpdateStrings.description,
                                    textAlign: TextAlign.center, // Centraliza o texto
                                    typographyColor: token.color.onSurfaceMedium,
                                    typographyStyle: DSTypographyStyleType.t16Regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: token.spacing.sm,
                              left: token.spacing.sm,
                              right: token.spacing.sm,
                              bottom: token.spacing.xs,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: DSButtonWidget(
                                type: DSButtonType.primary,
                                onPressed: () {
                                  cubit.goToStore();
                                },
                                text: ForceUpdateStrings.goStore,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
