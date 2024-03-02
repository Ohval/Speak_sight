import 'package:flutter/material.dart';

import 'light_color.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get appThemeTextColor => copyWith(color: LightColor.titleTextColor);

  TextStyle get subTitleColor => copyWith(color: LightColor.subTitleTextColor);
}

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: const EdgeInsets.all(16), child: this);

  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Set horizontal padding according to `value`
  Padding hp(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  /// Set vertical padding according to `value`
  Padding vp(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  /// Horizontal Padding 16
  Padding get hP4 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: this);
  Padding get hP8 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: this);
  Padding get hP16 =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: this);

  /// Vertical Padding 16
  Padding get vP16 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: this);
  Padding get vP8 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);
  Padding get vP4 =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: this);
}

extension Extented on Widget {
  Expanded get extended => Expanded(
        child: this,
      );
}

extension CornerRadius on Widget {
  Widget circular(double size) => ClipOval(
        child: SizedBox(
          width: size,
          height: size,
          child: this,
        ),
      );
  Widget circularCorner(double size) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: this,
      );
  // ClipOval get oval => ClipOval(
  //       // borderRadius: const BorderRadius.all(Radius.circular(1000)),
  //       child: this,
  //     );
}

extension OnPressed on Widget {
  Widget ripple(Function onPressed, {double borderRadius = 5}) => Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: MaterialButton(
                splashColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius))),
                onPressed: () {
                  onPressed();
                },
                child: Container()),
          )
        ],
      );
}

extension ExAlignment on Widget {
  Widget get alignTopCenter => Align(
        alignment: Alignment.topCenter,
        child: this,
      );
  Widget get alignCenter => Align(
        alignment: Alignment.center,
        child: this,
      );
  Widget get alignBottomCenter => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );
  Widget get alignBottomLeft => Align(
        alignment: Alignment.bottomLeft,
        child: this,
      );
}
