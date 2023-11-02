// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/dialog/dialog.dart';
import 'package:travel/components/textformfield/pw_form.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/components/content/content_appbar_1.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({
    Key? key,
    required this.user,
  }) : super(key: key);
  UserAccount user;
  static String routeName = '/change_pw';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    List<UserAccount> userList = await SharedPreferencesLocal.getUserAccount();
    for (var element in userList) {
      if (element.uid == widget.user.uid) {
        setState(() {
          widget.user = element;
        });
      }
    }
  }

  final oldPwController = TextEditingController();
  final newPwController = TextEditingController();
  final confirmPwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isShowOldPass = true;
  bool isShowNewPass = true;
  bool isShowConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      body: Stack(
        children: [
          //
          const AppBarWidget(),
          //
          ContentAppBar1(
            isFull: true,
            title: 'Thay đổi mật khẩu',
            onTap: onTapBack,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.bigPadding),
            child: Column(
              children: [
                const SizedBox(height: 200),
                //
                Flexible(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        PasswordForm(
                          controller: oldPwController,
                          obscureText: isShowOldPass,
                          onTapHidePw: () {
                            setState(() {
                              isShowOldPass = !isShowOldPass;
                            });
                          },
                          text: 'Mật khẩu cũ',
                          validator: validateOldPassword,
                          autovalidateMode: AutovalidateMode.disabled,
                        ),
                        SizedBox(height: Constants.bigPadding),
                        PasswordForm(
                          controller: newPwController,
                          obscureText: isShowNewPass,
                          onTapHidePw: () {
                            setState(() {
                              isShowNewPass = !isShowNewPass;
                            });
                          },
                          text: 'Mật khẩu mới',
                          validator: validateNewPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: Constants.bigPadding),
                        PasswordForm(
                          controller: confirmPwController,
                          obscureText: isShowConfirmPass,
                          onTapHidePw: () {
                            setState(() {
                              isShowConfirmPass = !isShowConfirmPass;
                            });
                          },
                          text: 'Nhập lại mật khẩu mới',
                          validator: validateConfirmPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 40),
                        ButtonPrimary(
                          nameButton: 'Cập nhật',
                          onTap: onTapUpdate,
                        ),
                        SizedBox(height: Constants.bigPadding),
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

  void onTapUpdate() async {
    if (formKey.currentState!.validate()) {
      List<UserAccount> userAccountList =
          await SharedPreferencesLocal.getUserAccount();
      List<int> bytes = utf8.encode(newPwController.text);
      for (var element in userAccountList) {
        if (element.uid == widget.user.uid) {
          setState(() {
            element.password = md5.convert(bytes).toString();
          });
        }
        SharedPreferencesLocal.saveUserAccount(userAccountList);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return DialogPrimary(
              title: 'Cập nhật thành công',
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            );
          },
        );
      }
    }
  }

  //validate
  String? validateOldPassword(String? value) {
    // return null;
    if ((value ?? '').isEmpty) return 'Mật khẩu không được để trống';

    String pw = widget.user.password;
    List<int> bytes = utf8.encode(value ?? '');
    if (md5.convert(bytes).toString() == pw) {
      return null;
    } else {
      return "Mật khẩu không đúng";
    }
  }

  //validate
  String? validateNewPassword(String? value) {
    if ((value ?? '').isEmpty) return 'Mật khẩu không được để trống';

    String pw = widget.user.password;
    List<int> bytes = utf8.encode(value ?? '');
    if (md5.convert(bytes).toString() == pw) {
      return "Mật khẩu trùng mật khẩu cũ";
    }
    RegExp pwRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (pwRegexp.hasMatch(value ?? "")) {
      return null;
    } else {
      return "Mật khẩu phải gồm 6 kí tự, 1 in hoa, in thường và số";
    }
  }

  //
  String? validateConfirmPassword(String? value) {
    // return null;
    if (value == newPwController.text) {
      return null;
    } else {
      return "Mật khẩu không khớp";
    }
  }
}
