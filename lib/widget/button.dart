import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SummitButton extends StatelessWidget {
final  VoidCallback onTap;
final String text;
  const SummitButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
    onTap: 
      onTap,
    
      child:   Container(
    
      
    
        width: double.infinity,
    
      
    
        height: 45.h,
    
      
    
        decoration:  BoxDecoration(
    
      color: Colors.green,
    
         // color: buttonColor,
    
      
    
          borderRadius: BorderRadius.all(Radius.circular(10.r))
    
      
    
        ),
    
      child: Center(child: Text(text)),
    
      ),
    
    );
  }
}
