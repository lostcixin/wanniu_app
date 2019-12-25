import 'dart:async';

import 'package:wanniu_app/components/button_component.dart';
import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/components/gradient_text.dart';
import 'package:wanniu_app/pages/users/forget_password_page.dart';
import 'package:wanniu_app/services/common_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          index = _controller.index;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _login() {
    showDialog(
        context: context,
        builder: (context) {
          // if (_userName.text == "admin" && _userPwd.text == "123456") {
          //   String sucess = "登录成功 \n" + _userName.text;
          //   return AlertDialog(
          //     content: Text(sucess),
          //   );
          // } else {
          //   String err = "登录失败 \n 账号或密码错误";
          //   return AlertDialog(
          //     content: Text(err),
          //   );
          // }
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Background(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: TabBar(
                            controller: _controller,
                            labelColor: Colors.blue,
                            tabs: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setWidth(30)),
                                child: this.index == 0
                                    ? GradientText("登录",
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            AppColors.LinearGradientStartColor,
                                            AppColors.LinearGradientEndColor,
                                          ],
                                        ),
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(36),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)
                                    : Text(
                                        "登录",
                                        style: AppStyles.disableTabTextStyle,
                                      ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: ScreenUtil().setWidth(30)),
                                child: this.index == 1
                                    ? GradientText("注册",
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            AppColors.LinearGradientStartColor,
                                            AppColors.LinearGradientEndColor,
                                          ],
                                        ),
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(36),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)
                                    : Text(
                                        "注册",
                                        style: AppStyles.disableTabTextStyle,
                                      ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))),
            body: TabBarView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[SginPage(), SginUpPage()],
            )));
  }
}

class SginPage extends StatefulWidget {
  @override
  _SginPageState createState() => _SginPageState();
}

class _SginPageState extends State<SginPage> {
  final _globalLoginKey = GlobalKey<FormState>();
  String userName, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(40.0),
      child: Form(
        key: _globalLoginKey,
        autovalidate: true, //自动校验
        child: Column(
          children: <Widget>[
            TextFormField(
              style: AppStyles.inputTextStyle,
              keyboardType: TextInputType.phone,
              onSaved: (value) => this.userName = value,
              decoration: InputDecoration(
                  hintText: "请输入手机号码",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  hintStyle: AppStyles.inputHintTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  )),
              validator: (v) {
                return v.trim().length > 0 ? null : "手机号码不能为空";
              },
            ),
            TextFormField(
              onSaved: (value) => this.password = value,
              style: AppStyles.inputTextStyle,
              decoration: InputDecoration(
                  hintText: "请输入密码",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  hintStyle: AppStyles.inputHintTextStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  )),
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不低于6位";
              },
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
            MyButton(
              text: "登录",
              onTap: () {
                if (_globalLoginKey.currentState.validate()) {
                  _globalLoginKey.currentState.save();
                }
              },
            ),
            FlatButton(
              onPressed: () {
                routePush(ForgetPasswordPage());
              },
              child: Text(
                '忘记密码',
                style: AppStyles.disableTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SginUpPage extends StatefulWidget {
  @override
  _SginUpPageState createState() => _SginUpPageState();
}

class _SginUpPageState extends State<SginUpPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String username, phone, password, anginPassword, code;

  final _globalRegisterKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool anginObscureText = true;
  Timer getCodeInterval;
  int getCodeTime = 59;
  String getCodeText = '获取验证码';

  void getCode() {
    if (phoneController.text.length == 0 || getCodeInterval != null) {
      return;
    }
    CommonService.getCode(phoneController.text).then((res) {
      _countdown();
    });
  }

  void register() {
    Map<String, dynamic> params = {
      "username": this.username,
      "mobile": this.phone,
      "code": this.code,
      "password": this.password
    };
    CommonService.register(params).then((res) {
      // if (res != null) {
      //   Navigator.pop(context);
      // }
    });
  }

  /// 倒计时
  void _countdown() {
    setState(() {
      if (getCodeInterval != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      getCodeText = '${getCodeTime--}s';
      getCodeInterval = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (getCodeTime > 0) {
            getCodeText = '${getCodeTime--}s';
          } else {
            getCodeText = '获取验证码';
            getCodeTime = 59;
            getCodeInterval.cancel();
            getCodeInterval = null;
          }
        });
      });
    });
  }

  @override
  void dispose() {
    getCodeInterval?.cancel();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(ScreenUtil().setWidth(44.0)),
      child: Form(
        key: _globalRegisterKey,
        autovalidate: true, //自动校验
        child: Column(
          children: <Widget>[
            TextFormField(
              style: AppStyles.inputTextStyle,
              onSaved: (String value) => username = value,
              decoration: InputDecoration(
                  hintText: "请勿使用手机号作为用户名",
                  hintStyle: AppStyles.inputHintTextStyle,
                  contentPadding: const EdgeInsets.only(top: 18),
                  prefixIcon: Image.asset(
                    'assets/images/username.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  )),
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: phoneController,
              style: AppStyles.inputTextStyle,
              onSaved: (String value) => phone = value,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "请输入电话号码",
                  hintStyle: AppStyles.inputHintTextStyle,
                  contentPadding: const EdgeInsets.only(top: 18),
                  prefixIcon: Image.asset(
                    'assets/images/phone.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  )),
              validator: (v) {
                return v.trim().length > 0 ? null : "手机号码不能为空";
              },
            ),
            TextFormField(
              style: AppStyles.inputTextStyle,
              onSaved: (String value) => code = value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "请输入验证码",
                  hintStyle: AppStyles.inputHintTextStyle,
                  contentPadding: const EdgeInsets.only(top: 18),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  prefixIcon: Image.asset(
                    'assets/images/code.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                  suffixIcon: Container(
                    padding: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(20),
                        0, ScreenUtil().setWidth(20)),
                    child: MyButton(
                      width: 163,
                      height: 54,
                      text: getCodeText,
                      fontSize: 24,
                      borderRadius: 5,
                      onTap: () {
                        getCode();
                      },
                    ),
                  )),
              validator: (v) {
                return v.trim().length > 0 ? null : "验证码不能为空";
              },
            ),
            TextFormField(
              style: AppStyles.inputTextStyle,
              onSaved: (String value) => password = value,
              controller: passwordController,
              obscureText: this.obscureText,
              decoration: InputDecoration(
                  hintText: "请输入6位以上字母数字组合",
                  contentPadding: const EdgeInsets.only(top: 18),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  prefixIcon: Image.asset(
                    'assets/images/password.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        this.obscureText = !this.obscureText;
                      });
                    },
                    icon: Image.asset(
                        this.obscureText
                            ? 'assets/images/no_show.png'
                            : 'assets/images/show.png',
                        width: ScreenUtil().setWidth(50)),
                  )),
              validator: (v) {
                return v.trim().length > 0 ? null : "密码不能为空";
              },
            ),
            TextFormField(
              style: AppStyles.inputTextStyle,
              obscureText: this.anginObscureText,
              onSaved: (String value) => anginPassword = value,
              decoration: InputDecoration(
                  hintText: "请再次输入密码",
                  contentPadding: const EdgeInsets.only(top: 18),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  ),
                  prefixIcon: Image.asset(
                    'assets/images/password.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                  hintStyle: AppStyles.inputHintTextStyle,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        this.anginObscureText = !this.anginObscureText;
                      });
                    },
                    icon: Image.asset(
                        this.anginObscureText
                            ? 'assets/images/no_show.png'
                            : 'assets/images/show.png',
                        width: ScreenUtil().setWidth(50)),
                  )),
              validator: (v) {
                if (v.trim().length == 0) {
                  return "密码不能为空";
                }
                if (this.passwordController.text != v) {
                  return "两次密码不一致";
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            MyButton(
              text: "注册",
              onTap: () {
                if (_globalRegisterKey.currentState.validate()) {
                  _globalRegisterKey.currentState.save();
                  register();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
