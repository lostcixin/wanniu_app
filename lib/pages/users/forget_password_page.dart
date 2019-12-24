import 'package:wanniu_app/components/button_component.dart';
import 'package:wanniu_app/components/components_index.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  GlobalKey _globalKey = new GlobalKey<FormState>(); //用于检查输入框是否为空
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
            appBar: AppBar(
              title: Text('忘记密码'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(ScreenUtil().setWidth(44.0)),
                child: Form(
                  key: _globalKey,
                  autovalidate: true, //自动校验
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "请输入电话号码",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "手机号码不能为空";
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "请输入验证码",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: Container(
                              padding: EdgeInsets.fromLTRB(
                                  0,
                                  ScreenUtil().setWidth(16),
                                  0,
                                  ScreenUtil().setWidth(16)),
                              child: MyButton(
                                width: 163,
                                height: 54,
                                text: '获取验证码',
                                fontSize: 24,
                                borderRadius: 5,
                                onTap: () {},
                              ),
                            )),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "验证码不能为空";
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "请输入6位以上字母数字组合",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: AppColors.DisableColor,
                              ),
                            )),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "密码不能为空";
                        },
                      ),
                      SizedBox(height: 40),
                      MyButton(
                        text: "确定",
                        onTap: () {
                          if ((_globalKey.currentState as FormState)
                              .validate()) {}
                        },
                      ),
                    ],
                  ),
                ))));
  }
}
