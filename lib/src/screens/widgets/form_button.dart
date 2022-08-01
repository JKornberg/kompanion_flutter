import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:chatbot_flutter/src/styles/button_styles.dart';
import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { Primary, Disabled, Loading }

class FormButton extends StatefulWidget {
  final ButtonType type;
  final String buttonText;
  final void Function()? onPressed;
  final Function? onDisablePressed;
  const FormButton(
      {this.type = ButtonType.Primary,
      required this.buttonText,
      this.onPressed,
      this.onDisablePressed,
      Key? key})
      : super(key: key);
  final double _offset = 1;
  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  bool hovered = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color hoverColor;
    TextStyle textStyle;
    Color borderColor;
    buttonColor = AppColors.accent;
    hoverColor = AppColors.highlight;
    borderColor = AppColors.dark;
    textStyle = TextStyles.button;
    return Padding(
      padding: BaseStyles.formVerticalPadding,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            if (widget.type != ButtonType.Disabled &&
                widget.type != ButtonType.Loading) pressed = true;
          });
        },
        onTapUp: (details) {
          if (mounted) {
            setState(() {
              if (widget.type != ButtonType.Disabled &&
                  widget.type != ButtonType.Loading) pressed = false;
            });
          }
        },
        onTapCancel: () {
          if (mounted) {
            setState(() {
              if (widget.type != ButtonType.Disabled &&
                  widget.type != ButtonType.Loading) pressed = false;
            });
          }
        },
        onTap: () {
          if (widget.type != ButtonType.Disabled &&
              widget.type != ButtonType.Loading) {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          } else {
            if (widget.onDisablePressed != null) {
              widget.onDisablePressed!();
            }
          }
        },
        child: Container(
          width: ButtonStyles.buttonWidth,
          height: ButtonStyles.buttonHeight,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ButtonStyles.borderRadius),
                side: BorderSide(color: borderColor),
              )),
              elevation: MaterialStateProperty.all(20),
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? AppColors.secondary
                      : null;
                },
              ),
            ),
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonText,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
