// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel/components/btns/button_primary.dart';
import 'package:travel/components/content_box/content_box.dart';
import 'package:travel/features/screens/login/login.dart';
import 'package:travel/features/widgets/appbar.dart';
import 'package:travel/models/user_account.dart';
import 'package:travel/resource/color.dart';
import 'package:travel/resource/constant.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserAccount user;

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
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
              backgroundColor: pink,
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: 220, left: bigPadding, right: bigPadding),
            child: Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ContentBox(
                    icon: Icons.verified_user,
                    title: 'Tài khoản',
                    color: pink,
                    content: widget.user.userName,
                  ),
                  ContentBox(
                    icon: Icons.person_outline,
                    title: 'Tên người dùng',
                    color: pink,
                    content: widget.user.name,
                    onTap: () {},
                  ),
                  ContentBox(
                    icon: Icons.password,
                    title: 'Mật khẩu',
                    color: pink,
                    content: 'Đổi mật khẩu',
                    onTap: () {},
                  ),
                  SizedBox(height: bigPadding),
                  ButtonPrimary(
                    nameButton: 'Đăng xuất',
                    onTap: onTapLogout,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTapLogout() {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }
}
