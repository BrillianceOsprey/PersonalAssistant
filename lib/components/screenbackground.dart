import 'package:flutter/material.dart';

Widget background(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/bg_img.png'))),
  );
}
