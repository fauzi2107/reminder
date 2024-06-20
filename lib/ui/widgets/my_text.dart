import '../../../ui_export.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? align;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;
  final bool isBold;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? letterSpacing;
  final EdgeInsetsGeometry? margin, padding;
  final TextStyle? textStyle;

  const MyText(this.text, {super.key,
    this.fontSize,
    this.overflow,
    this.decoration,
    this.maxLines,
    this.align,
    this.color,
    this.fontWeight,
    this.fontStyle = FontStyle.normal,
    this.isBold = false,
    this.height,
    this.letterSpacing = -0.16,
    this.margin,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(text,
        style: textStyle ?? TextStyle(
          color: color,
          fontSize: fontSize ?? 12,
          letterSpacing: letterSpacing,
          fontWeight: isBold
              ? FontWeight.bold
              : fontWeight ?? FontWeight.normal,
          decoration: decoration,
          height: height,
          fontStyle: fontStyle
        ),
        overflow: overflow,
        textAlign: align,
        maxLines: maxLines,
      ),
    );
  }
}