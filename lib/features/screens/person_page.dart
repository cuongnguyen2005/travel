// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/content/content_box.dart';
import 'package:travel/components/textformfield/text_form.dart';
import 'package:travel/features/screens/change_pw.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';
import 'package:travel/resource/shared_preferences.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key, required this.user});
  final UserAccount user;

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  ///lưu tên của user info
  Future<void> saveName(UserAccount userAccount) async {
    final userInfoList = await SharedPreferencesLocal.getUserAccount();
    for (var element in userInfoList) {
      if (element.uid == userAccount.uid) {
        setState(() {
          element.name = userAccount.name;
        });
      }
      SharedPreferencesLocal.saveUserAccount(userInfoList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarWidget(),
          Container(
            padding: const EdgeInsets.only(top: 45),
            width: double.infinity,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: AppColor.pink,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 220,
                left: Constants.bigPadding,
                right: Constants.bigPadding),
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ContentBox(
                        icon: Icons.verified_user,
                        title: 'Tài khoản',
                        color: AppColor.pink,
                        content: widget.user.userName,
                      ),
                      ContentBox(
                        icon: Icons.person_outline,
                        title: 'Tên người dùng',
                        color: AppColor.pink,
                        content: widget.user.name,
                        onTap: ontapChangeName,
                      ),
                      ContentBox(
                        icon: Icons.password,
                        title: 'Mật khẩu',
                        color: AppColor.pink,
                        content: 'Đổi mật khẩu',
                        onTap: onTapChangePw,
                      ),
                      SizedBox(height: Constants.bigPadding),
                      ButtonPrimary(
                        nameButton: 'Đăng xuất',
                        onTap: onTapLogout,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapLogout() {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  void ontapChangeName() {
    final nameController = TextEditingController()..text = widget.user.name;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextForm(controller: nameController, autofocus: false),
          actions: [
            Padding(
              padding: EdgeInsets.all(Constants.bigPadding),
              child: ButtonPrimary(
                nameButton: "Cập nhật",
                onTap: () {
                  setState(() {
                    widget.user.name = nameController.text;
                  });
                  saveName(widget.user);
                  onTapBack();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void onTapChangePw() {
    Navigator.pushNamed(context, ChangePassword.routeName,
        arguments: widget.user);
  }
}
