import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  // Icon/Image customization
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ImageProvider? leadingImage;

  // Styling
  final double height;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadiusGeometry borderRadius;
  final TextStyle? textStyle;

  // Progress Indicator customization
  final Color? progressColor;
  final double progressSize;
  final double progressStrokeWidth;
  final Widget? progressIndicator;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.leadingImage,
    this.height = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.backgroundColor,
    this.textColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.textStyle,
    this.progressColor,
    this.progressSize = 20.0,
    this.progressStrokeWidth = 2.0,
    this.progressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.black,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          padding: padding,
        ),
        child: isLoading
            ? progressIndicator ??
            SizedBox(
              height: progressSize,
              width: progressSize,
              child: CircularProgressIndicator(
                color: progressColor ?? Colors.white,
                strokeWidth: progressStrokeWidth,
              ),
            )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              const SizedBox(width: 8),
            ],
            if (leadingImage != null) ...[
              Image(
                image: leadingImage!,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                label,
                style: textStyle ??
                    theme.textTheme.labelLarge?.copyWith(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
