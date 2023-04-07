// Space
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.get("BASE_URL");
final String secretToken = dotenv.get("X-SECRET-TOKEN");

const Color kPrimaryColor = Color(0xFF2f5091);
const Color kBlueSoftColor = Color(0xFF6c85b0);
const Color kGreyColor = Color(0xFFf7f7f6);
const Color backgroundColor = Color(0xff32324D);

Widget kVerticalSpace(double height) => SizedBox(height: height);
Widget kHorizontalSpace(double width) => SizedBox(width: width);

// text style
final TextStyle kHeading5 = TextStyle(fontSize: 23, fontWeight: regular);
final TextStyle kHeading6 = TextStyle(fontSize: 16, fontWeight: medium);

// FontWeight
FontWeight thin = FontWeight.w100;
FontWeight extralight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
