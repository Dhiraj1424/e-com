import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class PasswordFieldName extends StatelessWidget {
  final String hintTexts, labelTexts;
  final String? Function(String?) validator;
  final TextEditingController textController;
  final String? Function(String?) changeFocus;
  final FocusNode focusNode;
  const PasswordFieldName(
      {Key? key,
      required this.hintTexts,
      required this.labelTexts,
      required this.validator,
      required this.textController,
            required this.changeFocus,

      required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

    final colors = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _obsecurePassword,
      builder: (context, value, child) {
       return TextFormField(
        controller: textController,
          focusNode: focusNode,
          onFieldSubmitted: changeFocus,
          validator: validator,
          obscureText: _obsecurePassword.value,
          obscuringCharacter: '*',
          
          decoration: InputDecoration(
            suffix: InkWell(
              onTap: (){
                _obsecurePassword.value=!_obsecurePassword.value;
              },
              child:  Icon(
                _obsecurePassword.value?Icons.visibility_off_outlined:Icons.visibility
              )),
            hintText: hintTexts,
            hintStyle:
                colors.textTheme.bodySmall!.apply(color: AppColors.infoColor),
            labelText: labelTexts,
            labelStyle:
                colors.textTheme.bodySmall!.apply(color: AppColors.infoColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.r)),
              gapPadding: 2.h,
              borderSide: const BorderSide(
                color: AppColors.focusColor,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.r)),
              gapPadding: 2.h,
              borderSide: BorderSide(
                color: AppColors.unFocusColor,
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
          )
          );}
    );
      }
  }
