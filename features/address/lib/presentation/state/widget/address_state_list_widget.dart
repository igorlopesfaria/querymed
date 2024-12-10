
import 'package:commons_navigation/navigator/common_navigator.dart';
import 'package:design_system_components/appbar/appbar.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.callback.dart';
import 'package:design_system_components/text/text.dart';
import 'package:design_system_components/textfield/textfield.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:features_address/domain/model/address_state.dart';
import 'package:features_address/presentation/state/bloc/address_state_list_cubit.dart';
import 'package:features_address/presentation/state/bloc/address_state_list_state.dart';
import 'package:features_address/presentation/state/string/address_state_string.dart';
import 'package:features_address/presentation/state/uimodel/address_state_ui_model.dart';
import 'package:features_address/presentation/state/widget/address_state_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AddressStateListWidget extends StatefulWidget {
  const AddressStateListWidget({
    super.key,
    this.addressDetailed
  });

  final AddressState? addressDetailed;

  @override
  State<StatefulWidget> createState() => _AddressStateListWidget();
}

class _AddressStateListWidget extends State<AddressStateListWidget> {
  final _cubit = GetIt.I.get<AddressStateListCubit>();
  final _token = DSTokenProvider().provide();

  AddressStateUiModel? _addressStateSelected;

  void selectAddressState(AddressStateUiModel currentValue) {
    setState(() {
      _addressStateSelected = currentValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _cubit.fillAddressStateInit();

    if (widget.addressDetailed != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
       selectAddressState(widget.addressDetailed!.mapToUiModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _token.color.surface,
      appBar: DSAppBarWidget(
        type: DSAppBarType.light,
        iconLeading: Icons.arrow_back,
        onPressedIconLeading: () => {
          CommonNavigator.maybePop(context)
        },
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<AddressStateListCubit, AddressStateListState>(
            listener: (BuildContext context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: _token.spacing.xs,
                              right: _token.spacing.xs
                          ),
                          child: DSTextWidget(
                              text: AddressStateListStrings.title,
                              typographyColor: _token.color.onSurfaceHigh,
                              typographyStyle: DSTypographyStyleType.t20Medium
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: _token.spacing.xxxs,
                              left: _token.spacing.xs,
                              right: _token.spacing.xs
                          ),
                          child: DSTextWidget(
                              textAlign: TextAlign.start,
                              text: AddressStateListStrings.description,
                              typographyColor: _token.color.onSurfaceHigh,
                              typographyStyle: DSTypographyStyleType.t14Regular
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _token.spacing.xs,
                              right: _token.spacing.xs,
                              top: _token.spacing.xs),
                          child:
                            DSTextFieldWidget(
                              enable: (state is AddressStateListSuccessState || state is AddressStateListEmptyState),
                              messageError: null,
                              controller: _cubit.searchControllerText,
                              leadingIcon: Icon(
                                Icons.search,
                                color: _token.color.onSurfaceMedium,
                              ),
                              trailingIcon: _cubit.searchControllerText.text
                                  .isNotEmpty ? Icon(
                                Icons.cancel_outlined,
                                color: _token.color.onSurfaceMedium,
                              ) : null,
                              trailingIconClick: () {
                                _cubit.searchControllerText.text = "";
                                _cubit.filterAddressStateByText();
                              },
                              keyboardType: TextInputType.text,
                              hintText: AddressStateListStrings.hintText1,
                              onTextChanged: (text) {
                                _cubit.filterAddressStateByText();
                              },
                            ),
                        ),
                        state is AddressStateListEmptyState || state is AddressStateListInternetErrorState || state is AddressStateListGenericErrorState ?
                        buildErrorStateWidget(state) : Container(),
                        state is AddressStateListLoadingState ?
                        buildLoadingWidget() : Container(),
                        state is AddressStateListSuccessState
                            ? buildListWidget(state)
                            : Container(),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Expanded buildListWidget(AddressStateListSuccessState state) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _token.spacing.xs,  vertical: _token.spacing.xs),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemCount: state.addressStateList.length,
          itemBuilder: (context, index) {
            return AddressStateItemWidget(
              addressStateItem: state.addressStateList[index],
              addressStateItemSelected: _addressStateSelected,
              itemSelectedListener: (item) {
                selectAddressState(item);
                Navigator.pop(context, item.mapToModel);
              },
            );
          },
        ),
      ),
    );
  }

  Expanded buildLoadingWidget() {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(
            _token.spacing.xs,
          ),
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: _token.color.onSurfaceLow,
            ),
          ),
        ));
  }

  Expanded buildErrorStateWidget(AddressStateListState state) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: _token.spacing.xs),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getStateErrorIcon(state),
                Padding(
                  padding: EdgeInsets.only(
                    top: _token.spacing.xxs,
                    left: _token.spacing.xs,
                    right:  _token.spacing.xs,
                  ),
                  child: getStateErrorTitle(state)
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: _token.spacing.xxxs,
                      left: _token.spacing.xs,
                      right:  _token.spacing.xs,
                    ),
                    child: getStateErrorDescription(state)
                ),
              ],
            ),
          ),
        ));
  }

  Icon getStateErrorIcon(AddressStateListState state) {
    IconData iconData;

    if (state is AddressStateListEmptyState) {
      iconData = Icons.search_off;
    } else if (state is AddressStateListInternetErrorState) {
      iconData = Icons.signal_wifi_connected_no_internet_4;
    } else {
      iconData = Icons.error_outline;
    }

    return Icon(
      iconData,
      color: _token.color.onSurfaceHigh,
      size: 48.0,
    );
  }

  DSTextWidget getStateErrorTitle(AddressStateListState state) {
    String text;

    if (state is AddressStateListEmptyState) {
      text = AddressStateListStrings.searchEmptyTitle;
    } else if (state is AddressStateListInternetErrorState) {
      text = DSFeedbackBottomSheetGenericErrorString.title;
    } else {
      text = DSFeedbackBottomSheetGenericErrorString.title;
    }

    return DSTextWidget(
            text: text,
            typographyColor:
            _token.color.onSurfaceHigh,
            typographyStyle:
            DSTypographyStyleType
                .t16Medium);
  }
  DSTextWidget getStateErrorDescription(AddressStateListState state) {
    String text;

    if (state is AddressStateListEmptyState) {
      text = AddressStateListStrings.searchEmptyDescription;
    } else if (state is AddressStateListInternetErrorState) {
      text = DSFeedbackBottomSheetGenericErrorString.description;
    } else {
      text = DSFeedbackBottomSheetGenericErrorString.description;
    }

    return DSTextWidget(
        text: text,
        textAlign: TextAlign.center,
        typographyColor:
        _token.color.onSurfaceHigh,
        typographyStyle:
        DSTypographyStyleType
            .t14Regular);
  }

}
