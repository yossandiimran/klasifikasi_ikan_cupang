import 'package:flutter/material.dart';
import 'package:klasifikasi_jenis_ikan_cupang/header.dart';

var appVersion = '0.0.1';

Global global = Global();
Alert alert = Alert();
CustomWidget widget = CustomWidget();
DropdownSingle itemDropdown = DropdownSingle();
TextStyling textStyling = TextStyling();

//Default Theme Color
Color defBlue = const Color(0xff1572e8), defRed = const Color(0xffea4d56);
Color defOrange = const Color(0xffff910a), defGreen = const Color(0xff2bb930);
Color defGrey = const Color(0xff8d9498), defBlack1 = const Color(0xff1a2035);
Color defBlack2 = const Color(0xff202940), defWhite = Colors.white;
Color defPurple = const Color(0xff6861ce), defPurple2 = const Color(0xff5c55bf);

Color defBrown = const Color(0xffF3B550);
Color defWhite2 = const Color(0xffEEEEEE);
Color defGreenDark = const Color(0xff497F5D);
Color defGreenDark2 = const Color(0xff336143);
Color defGreenDark3 = const Color(0xff1D453F);
Color defRedBos = const Color(0xffDC1F26);

class Global {
  getWidth(context) => MediaQuery.of(context).size.width;
  getHeight(context) => MediaQuery.of(context).size.height;
}
