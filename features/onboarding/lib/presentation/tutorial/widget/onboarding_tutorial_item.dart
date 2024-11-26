import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingTutorialItemWidget extends StatelessWidget {
  OnboardingTutorialItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;
  final token = DSTokenProvider().provide();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(imagePath),
        ),
        SizedBox(height: token.spacing.md),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: token.spacing.sm),
          child: DSTextWidget(
            text: title,
            textAlign: TextAlign.center,
            typographyColor: token.color.onSurfaceMedium,
            typographyStyle: DSTypographyStyleType.t24SemiBold,
          ),
        ),
      ],
    );
  }
}
