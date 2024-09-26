//====== Font Size 8 =====//
import 'package:flutter/material.dart';

const _s14Small = TextStyle(fontSize: 14, fontWeight: FontWeight.w200);

const _s12Normal = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
const _s14Normal = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
const _s16Normal = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
const _s18Normal = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
const _s22Normal = TextStyle(fontSize: 22, fontWeight: FontWeight.w400);
const _s24Normal = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
const _s32Normal = TextStyle(fontSize: 32, fontWeight: FontWeight.w400);

final _s12Bold = _s12Normal.copyWith(fontWeight: FontWeight.w700);
final _s14Bold = _s14Normal.copyWith(fontWeight: FontWeight.w700);
final _s16Bold = _s16Normal.copyWith(fontWeight: FontWeight.w700);
final _s18Bold = _s18Normal.copyWith(fontWeight: FontWeight.w700);
final _s22Bold = _s22Normal.copyWith(fontWeight: FontWeight.w700);
final _s24Bold = _s24Normal.copyWith(fontWeight: FontWeight.w700);
final _s32Bold = _s32Normal.copyWith(fontWeight: FontWeight.w700);

Widget _myText(String data,
    {TextStyle? style, int? maxLines, TextAlign? textAlign}) {
  return Text(
    data,
    textAlign: textAlign,
    maxLines: maxLines,
    style: style,
  );
}

Widget text12Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s12Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text12Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s12Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text14Small(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s14Small.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text14Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s14Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text14Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s14Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text16Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text16Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text16BoldColor(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Bold.copyWith(
        overflow: overflow, color: Colors.green, decoration: decoration),
  );
}

Widget text18Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text18Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text18BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}

Widget text18BoldTheme(BuildContext context, String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Bold.copyWith(
        overflow: overflow,
        color: Theme.of(context).dividerColor,
        decoration: decoration),
  );
}

Widget text18BoldColor(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s16Bold.copyWith(
        overflow: overflow, color: Colors.red, decoration: decoration),
  );
}

Widget text22Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text22Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text22BoldGreen(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(
        overflow: overflow, color: Colors.green, decoration: decoration),
  );
}

Widget text22BoldBlack(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(
        overflow: overflow, color: Colors.black, decoration: decoration),
  );
}

Widget text22BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s22Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}

Widget text18NormalTheme(BuildContext context, String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s18Normal.copyWith(
        overflow: overflow,
        color: Theme.of(context).primaryColor,
        decoration: decoration),
  );
}

Widget text24Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text24BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}

Widget text24Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s24Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32Normal(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Normal.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32Bold(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Bold.copyWith(overflow: overflow, decoration: decoration),
  );
}

Widget text32BoldWhite(String data,
    {int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign}) {
  return _myText(
    data,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _s32Bold.copyWith(
        overflow: overflow, color: Colors.white, decoration: decoration),
  );
}
