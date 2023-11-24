import 'package:flutter/material.dart';
import 'package:story_app/app/common/extension/context_extension.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton({
    super.key,
    required this.title,
    this.width = 100,
    this.height = 40,
    this.backgroundColor,
    this.onPressed,
    this.isLoading = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: context.colorScheme.onSecondary,
                    strokeWidth: 3.5,
                  ),
                )
              : Text(
                  title,
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: context.colorScheme.onPrimary),
                ),
        ),
      ),
    );
  }
}

class LargeButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final double width;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const LargeButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.backgroundColor,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: context.colorScheme.onSecondary,
                  strokeWidth: 3.5,
                ),
              )
            : Text(
                title,
                style: context.textTheme.labelLarge
                    ?.copyWith(color: context.colorScheme.onPrimary),
              ),
      ),
    );
  }
}
