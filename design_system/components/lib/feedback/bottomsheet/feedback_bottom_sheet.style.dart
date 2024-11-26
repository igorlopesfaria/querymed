import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';

class DSFeedbackBottomSheetStyle {
  DSFeedbackBottomSheetStyle();

  final token = DSTokenProvider().provide();

  String getIconByType(DSFeedbackBottomSheetType type) {
    switch (type) {
      case DSFeedbackBottomSheetType.fatalError:
        return token.assets.imFatalError;
      case DSFeedbackBottomSheetType.connectionError:
        return token.assets.imConnectionError;
    }
  }
}
