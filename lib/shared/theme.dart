part of 'shared.dart';

const double margin = 24;

Color primaryColor = Color(0xFFD63489);
Color greyColor = Color(0xFFADADAD);
Color whiteColor = Color(0xFFFFFFFF);
Color lightColor = Color(0xFFF2F2F2);
Color blackColor = Color(0xFF020202);

TextStyle blackTextFont = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);

TextStyle whiteTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);

TextStyle primaryTextFont = GoogleFonts.poppins()
    .copyWith(color: primaryColor, fontWeight: FontWeight.w500);

TextStyle greyTextFont = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500);

TextStyle boldTextFontprimary = GoogleFonts.poppins()
    .copyWith(color: primaryColor, fontWeight: FontWeight.bold);

TextStyle boldTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w900);
