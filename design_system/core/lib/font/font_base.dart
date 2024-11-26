import 'package:design_system_core/color/material_color_base.dart';
import 'package:flutter/material.dart';

class FontBase {
  FontBase({
    required this.family,
    required this.size,
    required this.weight,
    required this.color,
    required this.lineHeight,
  });

  FontFamilyBase family;
  FontSizeBase size;
  FontWeightBase weight;
  FontLineHeightBase lineHeight;
  MaterialColorBase color;
}

class FontFamilyBase {
  FontFamilyBase({
    required this.poppins,
  });

  String poppins;
}

class FontSizeBase {
  FontSizeBase({
    required this.t10,
    required this.t12,
    required this.t14,
    required this.t16,
    required this.t20,
    required this.t24,
    required this.h32,
    required this.h36,
    required this.h40,
  });

  double t10;
  double t12;
  double t14;
  double t16;
  double t20;
  double t24;
  double h32;
  double h36;
  double h40;
}

class FontWeightBase {
  FontWeightBase({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });

  FontWeight regular;
  FontWeight medium;
  FontWeight semiBold;
  FontWeight bold;

}
class FontLineHeightBase {
  FontLineHeightBase({
    required this.l12,
    required this.l16,
    required this.l20,
    required this.l24,
    required this.l28,
    required this.l32,
    required this.l36,
    required this.l44,
  });

  double l12;
  double l16;
  double l20;
  double l24;
  double l28;
  double l32;
  double l36;
  double l44;
}

