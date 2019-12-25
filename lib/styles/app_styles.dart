import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Primary = Color(0xFF276FFF);
  static const SubPrimary = Color(0xFF0BA3FE);
  static const AccentColor = Color(0XFFFF6969);
  static const FontColor = Color(0xFF181818);
  static const SubFontColor = Color(0xFF333333);
  static const ThirdFontColor = Color(0xFF95A1AB);
  static const DisableColor = Color(0xFFC9C9C9);
  static const SuccessColor = Color(0xFF44DB5E);
  static const ErrorColor = Color(0xFFFE5455);
  static const InfoColor = Color(0xFFFFAA0C);
  static const LineColor = Color(0xFFE8E9EB);
  static const IconColor = Color(0XFF727C8E);
  static const LinearGradientStartColor = Color(0xFF276FFF);
  static const LinearGradientEndColor = Color(0xFF191D86);
}

class AppStyles {
  static TextStyle inputHintTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(30.0),
    color: Color(0XFFC0C2DB),
  );

  static TextStyle inputTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(30.0),
    color: AppColors.FontColor,
  );

  static TextStyle defaultTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(24.0),
    color: AppColors.FontColor,
  );

  static TextStyle disableTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(26.0),
    color: AppColors.DisableColor,
  );

  static TextStyle disableTabTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(36.0),
    color: AppColors.DisableColor,
  );
}
