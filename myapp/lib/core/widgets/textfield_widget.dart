import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Widget? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;

  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final InputDecoration? decoration;
  final Color cursorColor;

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.black,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.decoration,
    this.cursorColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: isObscure,
        maxLength: 25,
        keyboardType: inputType,
        style: Theme.of(context).textTheme.bodyText1,
        cursorColor: cursorColor,
        decoration: decoration ??
            InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: hintColor),
              errorText: errorText,
              counterText: '',
              icon: isIcon ? icon : null,
            ),
      ),
    );
  }
}
