
import 'dart:ui';

class ColorsCode{

  static Color  fillTextField = hexToColor('#E7F1F6');
  static Color  bckBtn = hexToColor('#007CC2');
  static Color  txtHint  = hexToColor('#626262');
  static Color  txtBlack = hexToColor('#0E120E ');
  static Color  txtWhite = hexToColor('#FFFFFF ');
  static Color  txtGray = hexToColor('#929FA6 ');
  static Color  bckContainer = hexToColor('#F6FBFE ');


}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
