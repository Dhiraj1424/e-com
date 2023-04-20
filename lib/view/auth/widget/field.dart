import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class FieldName extends StatelessWidget {
  final String hintTexts, labelTexts;
  final String? Function(String?) validator;
  final TextEditingController textEController;
  final String? Function(String?) changeFocus;
  final FocusNode focusNode;
  const FieldName(
      {Key? key,
      required this.hintTexts,
      required this.labelTexts,
      required this.validator,
      required this.textEController,
            required this.changeFocus,

      required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    return TextFormField(
      controller: textEController,
        focusNode: focusNode,
        onFieldSubmitted: changeFocus,
        validator: validator,
        decoration: InputDecoration(
           filled: true, //<-- SEE HERE
    fillColor: AppColors.whiteColor,
          hintText: hintTexts,
          hintStyle:
              colors.textTheme.bodySmall!.apply(color: AppColors.infoColor),
          labelText: labelTexts,
          labelStyle:
              colors.textTheme.bodySmall!.apply(color: AppColors.infoColor),
                    // fillColor: focusNode.hasFocus ? Colors.amber:Colors.black26,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.r)),
            gapPadding: 2.h,
            borderSide: const BorderSide(
              color: AppColors.yellowColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.r)),
            gapPadding: 2.h,
          
            borderSide:const BorderSide(
              color: AppColors.lightBlue,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2.r),
            ),
            borderSide: BorderSide(
              color: colors.colorScheme.error,
              width: 1,
            ),
            gapPadding: 2.h,
          ),
        ));
  }
}