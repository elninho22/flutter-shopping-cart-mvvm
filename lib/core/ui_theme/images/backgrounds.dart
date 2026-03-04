import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../exports.dart';

class Backgrounds {
  static Widget logo({double? height, double? width}) => SvgPicture.asset(
        ImagesPath.logo,
        height: height,
        width: width,
      );
}
