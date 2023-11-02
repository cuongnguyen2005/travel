import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:travel/components/btns/button_no_box.dart';
import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/dialog/dialog.dart';
import 'package:travel/components/textformfield/pw_form.dart';
import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/screens/bottom_navigation.dart';
import 'package:travel/features/screens/signup/signup.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/validate_util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.userName});
  final String? userName;
  static String routeName = '/login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    usernameController.text = widget.userName ?? '';
    getUserList();
    super.initState();
  }

  List<UserAccount> userAccountList = [];

  void getUserList() async {
    userAccountList = await SharedPreferencesLocal.getUserAccount();
  }

  final usernameController = TextEditingController();
  final pwController = TextEditingController();
  bool isShowPass = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      body: Stack(
        children: [
          //
          const AppBarWidget(),
          ContentAppBar1(
            isFull: true,
            title: 'Đăng nhập',
            text: 'Chào mừng bạn quay trở lại!',
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.bigPadding),
            child: Column(
              children: [
                SizedBox(height: size.height * .3 + Constants.bigPadding),
                //
                Flexible(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        TextForm(
                          controller: usernameController,
                          autofocus: false,
                          text: 'Tài khoản',
                          validator: ValidateUntils.validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: Constants.bigPadding),
                        PasswordForm(
                          onTapHidePw: () {
                            setState(() {
                              isShowPass = !isShowPass;
                            });
                          },
                          controller: pwController,
                          obscureText: isShowPass,
                          text: 'Mật khẩu',
                          validator: ValidateUntils.validatePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 40),
                        ButtonPrimary(
                          nameButton: 'Đăng nhập',
                          onTap: onTapLogin,
                        ),
                        SizedBox(height: Constants.bigPadding),

                        //
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColor.grey,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: Text(
                                  'Hoặc đăng nhập với',
                                  style: tStyle.HS14Medium(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        ),

                        //
                        SizedBox(height: Constants.bigPadding),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.all(Constants.mediumPadding),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Constants.bigBorderRadius),
                                    color: AppColor.white),
                                child: Center(
                                    child: Text(
                                  'Google',
                                  style: tStyle.HS16MediumLB(),
                                )),
                              ),
                            ),
                            SizedBox(width: Constants.bigPadding),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                padding:
                                    EdgeInsets.all(Constants.mediumPadding),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Constants.bigBorderRadius),
                                    color: AppColor.blue),
                                child: Center(
                                    child: Text(
                                  'Facebook',
                                  style: tStyle.HS16W(),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Constants.bigPadding),

                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bạn không có tài khoản? ',
                              style: tStyle.HS14Medium(),
                            ),
                            ButtonNoBox(
                              onTap: onTapSignup,
                              nameButton: 'Đăng kí',
                              style: tStyle.HS14BoldPurple(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapSignup() {
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void onTapBack() {
    Navigator.of(context).pop();
  }

  void onTapLogin() {
    if (formKey.currentState!.validate()) {
      bool isCheck = false;
      bool isCheckUsername = false;
      for (var element in userAccountList) {
        List<int> bytes = utf8.encode(pwController.text);
        if (element.userName.toUpperCase() ==
                usernameController.text.toUpperCase() &&
            element.password == md5.convert(bytes).toString()) {
          isCheck = true;

          Navigator.pushNamedAndRemoveUntil(
              context, BottomNavigationPage.routeName, (route) => false,
              arguments: element);
        }
        if (element.userName.toUpperCase() ==
            usernameController.text.toUpperCase()) {
          isCheckUsername = true;
        }
      }
      if (isCheckUsername == false) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return DialogPrimary(
              title: 'Tài khoản không tồn tại',
              onTap: onTapBack,
            );
          },
        );
      } else {
        if (isCheck == false) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return DialogPrimary(
                title: 'Mật khẩu sai',
                onTap: onTapBack,
              );
            },
          );
        }
      }
    }
  }
}
