import 'package:commons_core/animation/custom_animation.dart';
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:design_system_components/button/button.dart';
import 'package:design_system_components/cell/list/cell_list.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:features_help/presentation/bloc/help_cubit.dart';
import 'package:features_help/presentation/bloc/help_state.dart';
import 'package:features_help/presentation/string/help_string.dart';
import 'package:lottie/lottie.dart';

class HelpWidget extends StatefulWidget {
  const HelpWidget({
    super.key,
  });

  @override
  State createState() => _HelpWidget();
}

class _HelpWidget extends State<HelpWidget>   with TickerProviderStateMixin{
  final HelpCubit cubit = GetIt.I.get<HelpCubit>();
  final token = DSTokenProvider().provide();
  late final AnimationController _controller;


  @override
  void initState() {
    super.initState();
    cubit.getContact();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: BlocConsumer<HelpCubit, HelpState>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center, // Alinha ao centro no eixo horizontal
                  mainAxisAlignment: MainAxisAlignment.center, // Centraliza no eixo vertical
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: token.spacing.sm,
                        right: token.spacing.sm),
                    child: SizedBox(
                        child: Lottie.asset(
                          token.assets.animHelp,
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                          decoder: customDecoder,
                          controller: _controller,
                          onLoaded: (composition) {
                            _controller
                              ..duration = composition.duration
                              ..forward()
                              ..repeat();
                          },
                        )
                    )
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: token.spacing.sm,
                        right:  token.spacing.sm,
                        bottom:  token.spacing.xxs,
                      ),
                      child: DSTextWidget(
                        text: HelpStrings.title,
                        textAlign: TextAlign.center,
                        typographyColor: token.color.onSurfaceHigh,
                        typographyStyle: DSTypographyStyleType.t16SemiBold)),

                  Padding(padding: EdgeInsets.symmetric(
                      horizontal: token.spacing.sm
                  ), child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: token.color.surfaceOutlineMedium,
                            width: 0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                        elevation: 0,
                        child:Container(
                            decoration:
                            BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: token.color.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child:InkWell(
                              onTap: () {},
                              child: DSCellListWidget(
                                title: HelpStrings.whatsapp,
                                description: (state is HelpSuccessState)? state.contact.whatsappNumberFormatted : "",
                                onPressed: () {

                                },
                                imagePath: token.assets.icWhatsapp,
                              )
                            )
                        ))
                  ),

                  Padding(padding: EdgeInsets.symmetric(
                      horizontal: token.spacing.sm
                  ), child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: token.color.surfaceOutlineMedium, width: 0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                      child:Container(
                          decoration:
                          BoxDecoration(shape: BoxShape.rectangle, color: token.color.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:InkWell(
                              onTap: () {},
                              child: DSCellListWidget(
                                title: HelpStrings.email,
                                description: (state is HelpSuccessState)? state.contact.email : "",
                                onPressed: () {

                                },
                                icon: Icons.email_outlined,
                              ))))
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: token.spacing.xxxs,
                        horizontal: token.spacing.sm
                    ),
                    child: DSTextWidget(
                        text: HelpStrings.description,
                        textAlign: TextAlign.center,
                        typographyColor: token.color.onSurfaceMedium,
                        typographyStyle: DSTypographyStyleType.t10Regular),
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: token.spacing.sm,
                              vertical: token.spacing.xs
                          ), child: DSButtonWidget(
                            text: HelpStrings.close,
                            onPressed: () => {
                              CommonNavigator.pop(context)
                            },
                            type: DSButtonType.primary)
                      )),
              ]));
        }));
  }

}

