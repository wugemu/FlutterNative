import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class DesignColors{
  static const int _mainBgColor=0xFFF8F8F8;
  static const MaterialColor bgColor = MaterialColor(_mainBgColor,<int,Color>{
      100: Color(0xFFF8F8F8),
    }
  );

  static const int _mainTextColor=0xFF333333;
  static const MaterialColor mainTextColor = MaterialColor(_mainTextColor,<int,Color>{
    10: Color(0xFF969696),
    50: Color(0xFF626262),
    100: Color(0xFF333333),
    30:Color(0xFF9FA7AF),
  }
  );

  static const int _mainWhiteColor=0xFFFFFFFF;
  static const MaterialColor mainWhiteColor = MaterialColor(_mainWhiteColor,<int,Color>{
    100: Color(0xFFFFFFFF),
  }
  );

  static const int _mainRedColor=0xFFFF1341;
  static const MaterialColor mainRedColor = MaterialColor(_mainRedColor,<int,Color>{
    100: Color(0xFFFF1341),
  }
  );

  static const int _mainOrgColor=0xFFFA9903;
  static const MaterialColor mainOrgColor = MaterialColor(_mainOrgColor,<int,Color>{
    100: Color(0xFFFA9903),
    50:Color(0xFFFF7C00),
    80:Color(0xFFFF7C00),
  }
  );

  static const int _mainBlueColor=0xFF235275;
  static const MaterialColor mainBlueColor = MaterialColor(_mainBlueColor,<int,Color>{
    100:Color(0xFF235275),
    80: Color(0xCC235275),
    50: Color(0xFF84AAC6),
  }
  );
}