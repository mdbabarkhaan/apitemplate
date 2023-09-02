import 'package:flutter/widgets.dart';
import 'package:apitemplate/constants/app_colors.dart';

class AppTextstyle {

  static TextStyle normalText({FontWeight fontWeight = FontWeight.normal, double fontSize = 14}) =>TextStyle(
          // fontFamily: Fonts.DEFAULT_FONT_FAMILY,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: TextOverflow.ellipsis,
          color: AppColors.black);

  
}
