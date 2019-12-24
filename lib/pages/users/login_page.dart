import 'package:wanniu_app/components/button_component.dart';
import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/components/gradient_text.dart';
import 'package:wanniu_app/pages/users/forget_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _userName = TextEditingController(); //用户名
  final _userPwd = TextEditingController(); //密码
  GlobalKey _globalLoginKey = new GlobalKey<FormState>(); //用于检查输入框是否为空
  GlobalKey _globalRegisterKey = new GlobalKey<FormState>(); //用于检查输入框是否为空
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
        // if (_controller.index.toDouble() == _controller.animation.value) {
        //   setState(() {
        //     index = _controller.index;
        //   });
        // }
      });
    _getLoginMsg();
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
          if (_userName.text == "admin" && _userPwd.text == "123456") {
            String sucess = "登录成功 \n" + _userName.text;
            return AlertDialog(
              content: Text(sucess),
            );
          } else {
            String err = "登录失败 \n 账号或密码错误";
            return AlertDialog(
              content: Text(err),
            );
          }
        });
  }

  // 保存账号密码
  void _saveLoginMsg() async {
    StorageService.set("name", _userName.text, encrypt: true);
    StorageService.set("pwd", _userPwd.text, encrypt: true);
  }

  // 读取账号密码，并将值直接赋给账号框和密码框
  void _getLoginMsg() async {
    _userName.text = await StorageService.get("name");
    _userPwd.text = await StorageService.get("pwd");
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
                                    ? GradientText("登陆",
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
                                        "登陆",
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
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.all(40.0),
                  child: Form(
                    key: _globalLoginKey,
                    autovalidate: true, //自动校验
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _userName,
                          decoration: InputDecoration(
                              // labelText: "账号",
                              hintText: "请输入手机号码"
                              // icon: Icon(Icons.person),
                              ),
                          validator: (v) {
                            return v.trim().length > 0 ? null : "手机号码不能为空";
                          },
                        ),
                        TextFormField(
                          controller: _userPwd,
                          decoration: InputDecoration(
                            // labelText: "密码",
                            hintText: "请输入密码",
                            // icon: Icon(Icons.lock),
                          ),
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
                            if ((_globalLoginKey.currentState as FormState)
                                .validate()) {
                              _login();
                              _saveLoginMsg();
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
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(44.0)),
                  child: Form(
                    key: _globalRegisterKey,
                    autovalidate: true, //自动校验
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "请勿使用手机号作为用户名",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (v) {
                            return v.trim().length > 0 ? null : "用户名不能为空";
                          },
                        ),
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
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "请再次输入密码",
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
                          text: "注册",
                          onTap: () {
                            if ((_globalLoginKey.currentState as FormState)
                                .validate()) {
                              _login();
                              _saveLoginMsg();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
