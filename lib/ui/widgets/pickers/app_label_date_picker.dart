import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';
import 'package:flutter_app/common/app_text_styles.dart';
import 'package:flutter_app/ui/commons/app_dialog.dart';
import 'package:intl/intl.dart';

class DatePickerController extends ValueNotifier<DateTime?> {
  DatePickerController({DateTime? dateTime}) : super(dateTime);

  DateTime? get date => value;

  set date(DateTime? newDate) {
    value = newDate;
  }
}

class AppLabelDatePicker extends StatelessWidget {
  final DatePickerController? controller;
  final String dateFormat;
  final DateTime? minTime;
  final DateTime? maxTime;
  final ValueChanged<DateTime>? onChanged;

  final String labelText;
  final TextStyle? labelStyle;
  final String highlightText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool enabled;

  AppLabelDatePicker({
    this.dateFormat = "dd/MM/yyyy",
    this.minTime,
    this.maxTime,
    this.controller,
    this.labelText = "",
    this.labelStyle,
    this.highlightText = "*",
    this.suffixIcon,
    this.textStyle,
    this.hintText = "",
    this.hintStyle,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: labelText ?? "",
                  style: labelStyle ?? AppTextStyle.blackS12,
                ),
                TextSpan(
                  text: highlightText ?? "*",
                  style: AppTextStyle.blackS12.copyWith(color: Colors.red),
                )
              ]),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller!,
            child: Container(),
            builder: (context, DateTime? dateTime, child) {
              var dateString = "";
              if ((dateFormat != null) && (dateTime != null)) {
                dateString = DateFormat(dateFormat).format(dateTime);
              }
              return GestureDetector(
                onTap: () {
                  _showDatePicker(context: context);
                },
                child: TextField(
                  enabled: false,
                  textInputAction: TextInputAction.search,
                  controller: TextEditingController(text: dateString),
                  style: textStyle ?? AppTextStyle.blackS16,
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldEnabledBorder),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldFocusedBorder),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textFieldDisabledBorder),
                    ),
                    fillColor: Colors.white,
                    hintStyle: hintStyle ?? AppTextStyle.greyS16,
                    hintText: hintText ?? "",
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 8, bottom: 12),
                    suffixIcon: suffixIcon ?? Icon(Icons.date_range_outlined),
                    suffixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 32),
                  ),
                  cursorColor: AppColors.textFieldCursor,
                ),
              );
            },
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }

  _showDatePicker({
    BuildContext? context,
  }) {
    if (!enabled) {
      return;
    }
    if (context == null) {
      return;
    }
    AppDialog.showDatePicker(
      context,
      maxTime: maxTime,
      minTime: minTime,
      onConfirm: (dateTime) {
        onChanged?.call(dateTime);
        controller?.date = dateTime;
      },
      currentTime: controller?.date ?? DateTime.now(),
    );
  }
}
