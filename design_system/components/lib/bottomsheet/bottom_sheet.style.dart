import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';

class DSBottomSheetStyle {
  DSBottomSheetStyle();
  final token = DSTokenProvider().provide();

  late final elevation = token.spacing.xxxs;
  late final borderRadius = token.radius.xlg;
  late final backgroundColor = token.color.white;


  late final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(borderRadius),
    ),
  );
}
