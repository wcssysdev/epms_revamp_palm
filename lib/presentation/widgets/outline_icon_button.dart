import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? foregroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final double gap; //
  final double elevationOnPress; // optional shadow
  final double outlineHeight;

  const OutlineIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.borderColor,
    this.foregroundColor,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
    this.textStyle,
    this.gap = 10,
    this.elevationOnPress = 0,
    this.outlineHeight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorder = borderColor ?? Theme.of(context).primaryColor;
    final Color effectiveForeground = foregroundColor ?? effectiveBorder;

    return Material(
      elevation: 4, // bayangan timbul
      borderRadius: BorderRadius.circular(borderRadius),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size.fromHeight(outlineHeight),
          side: BorderSide(color: effectiveBorder, width: 1.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          foregroundColor: effectiveForeground,
        ).copyWith(
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) {
              return effectiveForeground.withOpacity(0.08);
            }
            return null;
          }),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            IconTheme(
              data: IconThemeData(color: effectiveForeground),
              child: icon,
            ),
            SizedBox(width: gap),
            Text(
              label,
              style:
                  textStyle ??
                  TextStyle(
                    color: effectiveForeground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
