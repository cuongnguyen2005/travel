import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/dialog/dialog.dart';
import 'package:travel/components/textformfield/pw_form.dart';
import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/features/widgets/content_appbar_1.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';
import 'package:travel/resource/typo.dart';
import 'package:travel/resource/utils/validate_util.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String routeName = '/signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    getUserList();
    super.initState();
  }

  List<UserAccount> userAccountList = [];

  void getUserList() async {
    userAccountList = await getUserAccount();
  }

  //hàm thêm mới 1 account
  void addUserAccount(UserAccount newUser) {
    setState(() {
      userAccountList.add(newUser);
    });
    saveUserAccount(userAccountList);
  }

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isShowPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey,
      body: Stack(
        children: [
          //
          const AppBarWidget(),
          //
          ContentAppBar1(
            isFull: true,
            title: 'Đăng kí',
            text: 'Hãy tạo tài khoản cho bạn!',
            onTap: onTapBack,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 200),
                //
                Flexible(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        TextForm(
                          controller: nameController,
                          autofocus: false,
                          text: 'Tên',
                          validator: ValidateUntils.validateName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: bigPadding),
                        TextForm(
                          controller: usernameController,
                          autofocus: false,
                          text: 'Tài khoản',
                          validator: ValidateUntils.validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: bigPadding),
                        PasswordForm(
                          controller: pwController,
                          obscureText: isShowPass,
                          onTapHidePw: () {
                            setState(() {
                              isShowPass = !isShowPass;
                            });
                          },
                          text: 'Mật khẩu',
                          validator: ValidateUntils.validatePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 40),
                        ButtonPrimary(
                          nameButton: 'Đăng kí',
                          onTap: onTapSignup,
                        ),
                        SizedBox(height: bigPadding),

                        //
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: grey,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  'Hoặc đăng kí với',
                                  style: tStyle.HS14Medium(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                color: grey,
                              ),
                            )
                          ],
                        ),

                        //
                        SizedBox(height: bigPadding),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(mediumPadding),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(bigBorderRadius),
                                    color: white),
                                child: Center(
                                    child: Text(
                                  'Google',
                                  style: tStyle.HS16MediumLB(),
                                )),
                              ),
                            ),
                            SizedBox(width: bigPadding),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(mediumPadding),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(bigBorderRadius),
                                    color: blue),
                                child: Center(
                                    child: Text(
                                  'Facebook',
                                  style: tStyle.HS16W(),
                                )),
                              ),
                            ),
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

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSignup() {
    if (formKey.currentState!.validate()) {
      bool isCheck = false;
      for (var element in userAccountList) {
        if (element.userName.toUpperCase() ==
            usernameController.text.toUpperCase()) {
          isCheck = true;
          break;
        }
      }
      if (isCheck != true) {
        Uuid uuid = const Uuid();
        List<int> bytes = utf8.encode(pwController.text);
        final UserAccount account = UserAccount(
          uid: uuid.v4(),
          name: nameController.text,
          userName: usernameController.text,
          password: md5.convert(bytes).toString(),
          createAt: DateTime.now(),
          modifieAt: DateTime.now(),
        );
        addUserAccount(account);
        Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (route) => false,
            arguments: usernameController.text);
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return DialogPrimary(
              title: 'Tài khoản đã tồn tại',
              onTap: onTapBack,
            );
          },
        );
      }
    }
  }
}
