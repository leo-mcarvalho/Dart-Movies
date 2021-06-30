import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static final titleHome = GoogleFonts.juliusSansOne(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final bodyRegular = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final bodytitle = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final rating = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
  static final bodyBold = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
}
