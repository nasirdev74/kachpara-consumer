import 'package:flutter/material.dart';

class FFButtonOptions {
  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final double? borderRadius;
  final BorderSide? borderSide;
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    this.options,
    this.showLoadingIndicator = true,
  });

  final String text;
  final Widget? icon;
  final IconData? iconData;
  final Function()? onPressed;
  final FFButtonOptions? options;
  final bool showLoadingIndicator;

  @override
  State<ButtonWidget> createState() => _FFButtonWidgetState();
}

class _FFButtonWidgetState extends State<ButtonWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: widget.options?.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.options?.borderRadius ?? 100),
      ),
    );

    Widget textWidget = loading
        ? const Center(
            child: SizedBox(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
          )
        : Text(
            widget.text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

    final onPressed = widget.showLoadingIndicator
        ? () async {
            if (loading) {
              return;
            }
            setState(() => loading = true);
            try {
              if (widget.onPressed != null) {
                await widget.onPressed!();
              }
            } catch (e) {
              print('On pressed error:\n$e');
            }
            setState(() => loading = false);
          }
        : widget.onPressed;

    if (widget.icon != null || widget.iconData != null) {
      return SizedBox(
        child: ElevatedButton.icon(
          style: buttonStyle,
          icon: widget.icon ??
              Icon(
                widget.iconData,
              ),
          label: textWidget,
          onPressed: onPressed,
        ),
      );
    }

    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        child: textWidget,
        style: buttonStyle,
      ),
    );
  }
}
