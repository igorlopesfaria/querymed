import 'package:design_system_components/text/text.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_address/presentation/state/uimodel/address_state_ui_model.dart';
import 'package:flutter/material.dart';

class AddressStateItemWidget extends StatefulWidget {
  const AddressStateItemWidget({
    super.key,
    required this.addressStateItem,
    required this.addressStateItemSelected,
    required this.itemSelectedListener
  });

  final AddressStateUiModel addressStateItem;
  final AddressStateUiModel? addressStateItemSelected;
  final void Function(AddressStateUiModel) itemSelectedListener;

  @override
  State<AddressStateItemWidget> createState() => _AddressStateItemWidget();
}

class _AddressStateItemWidget extends State<AddressStateItemWidget> {
  final _token = DSTokenProvider().provide();

  @override
  Widget build(BuildContext context) {
    final token = DSTokenProvider().provide();

    return GestureDetector(
        onTap: () {
          widget.itemSelectedListener(widget.addressStateItem);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
                height: 30,
                width: 40,
                child: Image.network(
                    widget.addressStateItem.flagImagePath

                )),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _token.spacing.xxs
                ),
                child: DSTextWidget(
                    text: '${widget.addressStateItem.stateName} - ${widget.addressStateItem.stateCode}',
                    textAlign: TextAlign.left,
                    typographyColor: _token.color.onSurfaceHigh,
                    typographyStyle:
                    DSTypographyStyleType.t16Medium
                )),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Radio<AddressStateUiModel>(
                        fillColor: WidgetStateColor.resolveWith(
                                (states) => token.color.secondaryDark
                        ),
                        value: widget.addressStateItem,
                        onChanged: (value) {
                          widget.itemSelectedListener(value!);
                        },
                        groupValue: widget.addressStateItemSelected,
                      ),

                    ]
                  )
                ),
          ],
        ));
  }

}
