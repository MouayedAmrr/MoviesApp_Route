import 'package:flutter/material.dart';
import '../theme/color_palette.dart';

class CustomElevatedButton extends StatefulWidget {
  final String title;
  final Function()? onTap;
  final Color? bgColor; // Background color (changeable)
  final double borderRadius;
  final Color titleColor;
  final double titleSize; // New property for text size
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onTap,
    this.bgColor,
    this.titleColor = ColorPalette.white,
    this.borderRadius = 16,
    this.titleSize = 16, // Default font size
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.bgColor ?? ColorPalette.primaryColor;
  }

  void changeColor(Color newColor) {
    setState(() {
      currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: currentColor, // Dynamic background color
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      onPressed: () {
        widget.onTap?.call();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // Keeps button compact
        children: [
          if (widget.prefixIcon != null)
            Icon(widget.prefixIcon, color: widget.prefixIconColor ?? widget.titleColor),
          if (widget.prefixIcon != null) const SizedBox(width: 8),
          Text(
            widget.title,
            style: TextStyle(
              color: widget.titleColor,
              fontSize: widget.titleSize, // Dynamic title size
              fontWeight: FontWeight.bold, // Optional: Make text bold
            ),
          ),
          if (widget.suffixIcon != null) const SizedBox(width: 8),
          if (widget.suffixIcon != null)
            Icon(widget.suffixIcon, color: widget.suffixIconColor ?? widget.titleColor),
        ],
      ),
    );
  }
}
