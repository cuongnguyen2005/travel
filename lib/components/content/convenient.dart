import 'package:flutter/material.dart';

import 'package:travel/resource/constant.dart';
import 'package:travel/resource/typo.dart';

class Convenient extends StatelessWidget {
  const Convenient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/wifi.png'),
            SizedBox(height: Constants.smallPadding),
            Text(
              'Wifi\nmiễn phí',
              style: tStyle.HS12LB(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/no_redundable.png'),
            SizedBox(height: Constants.smallPadding),
            Text(
              'Không\nhoàn lại',
              style: tStyle.HS12LB(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/breakfast.png'),
            SizedBox(height: Constants.smallPadding),
            Text(
              'Ăn sáng\nmiễn phí',
              style: tStyle.HS12LB(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/no_smoke.png'),
            SizedBox(height: Constants.smallPadding),
            Text(
              'Không\nkhói thuốc',
              style: tStyle.HS12LB(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
