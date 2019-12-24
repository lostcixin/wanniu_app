import 'package:wanniu_app/components/components_index.dart';

/// 默认按钮
class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final bool disable;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final Color gradientColor1;
  final Color gradientColor2;
  final bool pureColor;
  final double fontSize;
  final double borderRadius;

  const MyButton({
    Key key,
    @required this.onTap,
    @required this.text,
    this.disable = false,
    this.width = 606,
    this.height = 94,
    this.color = AppColors.Primary,
    this.elevation = 0.0,
    this.gradientColor1 = AppColors.LinearGradientStartColor,
    this.gradientColor2 = AppColors.LinearGradientEndColor,
    this.pureColor = false,
    this.fontSize = 36,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(this.width),
      height: ScreenUtil().setWidth(this.height),
      child: RaisedButton(
        child: Container(
          decoration: BoxDecoration(
            color: this.pureColor == true ? this.color : null,
            gradient: this.pureColor == false
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      this.gradientColor1,
                      this.gradientColor2,
                    ],
                  )
                : null,
          ),
          // padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              this.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(this.fontSize),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(
              this.borderRadius == null ? this.height / 2 : this.borderRadius)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(0.0),
        color: this.color,
        elevation: elevation,
        disabledColor: AppColors.DisableColor,
        onPressed: disable ? null : onTap,
      ),
    );
  }
}
