import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HelpItemLoading extends StatelessWidget {
  HelpItemLoading({
    super.key,
  });

  final token = DSTokenProvider().provide();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: token.color.surfaceContainer,
      highlightColor: token.color.white,
      child: Padding(
          padding: EdgeInsets.only(
              top: token.spacing.lg,
              left: token.spacing.lg
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            color: token.color.white,
            elevation: 0,
            child: Container(
              color: token.color.white,
              height: 20,
              width: 75,
            ),
          )),
    );
  }
}
