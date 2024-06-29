import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../wallet_page/widgets/constant.dart';

class InputFields extends StatelessWidget {
  final String headerText;
  final String hintText;
  final bool hasHeader;
  final TextEditingController? textController;
  final bool? isEditable;
  final Widget? suffixIcon;
  final Function? onChange;
  final TextInputType? inputType;

  InputFields(
      {Key? key,
      required this.headerText,
      required this.hintText,
      required this.hasHeader,
      this.textController,
      this.isEditable,
      this.suffixIcon,
      this.inputType,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(),
          child: Text(
            headerText,
            style: TextStyle(
              color: placeholderColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'sfpro',
            ),
          ),
        ),
        TextField(
          cursorColor: primaryColor,
          cursorHeight: 20,
          controller: textController,
          enabled: isEditable,
          keyboardType: inputType ?? TextInputType.text,
          inputFormatters: [
            inputType == null
                ? LengthLimitingTextInputFormatter(headerText.contains('Name') ? 18 : 50)
                : FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}'))
          ],
          style: const TextStyle(
            fontSize: 14,
            color: inputFieldTextColor,
          ),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 14,
              color: labelColor,
            ),
            filled: true,
            fillColor: inputFieldBackgroundColor,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: cardColor, width: 0.1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: cardColor, width: 0.1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: cardColor, width: 0.1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: cardColor, width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {
            onChange!.call(value);
          },
        ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  final String headerText;
  final String hintText;
  final TextEditingController? textController;
  final bool? isEditable;
  final Function onChange;
  final String? svg;

  InputFieldPassword({
    Key? key,
    required this.headerText,
    required this.hintText,
    required this.textController,
    required this.onChange,
    this.isEditable,
    this.svg,
  }) : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
              color: headingColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'sfpro',
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 60,
                height: 58,
                decoration: const BoxDecoration(
                  color: inputFieldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/icons/${widget.svg}.svg',
                    color: headingColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  cursorColor: primaryColor,
                  cursorHeight: 20,
                  enabled: widget.isEditable,
                  onChanged: (val) {
                    widget.onChange.call();
                  },
                  style: const TextStyle(color: inputFieldTextColor),
                  controller: widget.textController,
                  obscureText: _visible,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(fontSize: 14, color: placeholderColor),
                      filled: true,
                      //<-- SEE HERE
                      fillColor: inputFieldBackgroundColor,
                      //focusColor: activeInputColor,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        borderSide: BorderSide(color: cardColor, width: 0.1),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        borderSide: BorderSide(color: cardColor, width: 0.1),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                        borderSide: BorderSide(color: cardColor, width: 0.1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: cardColor, width: 0.1),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(_visible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: primaryColor),
                          onPressed: () {
                            setState(() {
                              _visible = !_visible;
                            });
                          })),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle defaultBtnStyle = new TextStyle(
  color: btnTxtColor,
  fontSize: 18,
);

class InputFieldsWithSeparateIcon extends StatelessWidget {
  final String headerText;
  final String hintText;
  final bool hasHeader;
  final TextEditingController? textController;
  final bool? isEditable;
  final Widget? suffixIcon;
  final Function? onChange;
  final String? svg;
  final TextInputType? inputType;

  InputFieldsWithSeparateIcon(
      {Key? key,
      required this.headerText,
      required this.hintText,
      required this.hasHeader,
      this.textController,
      this.isEditable,
      this.suffixIcon,
      this.svg,
      this.inputType,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
              color: headingColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 60,
              height: 58,
              decoration: const BoxDecoration(
                color: inputFieldBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/icons/$svg.svg',
                  color: headingColor,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: TextField(
                cursorColor: primaryColor,
                cursorHeight: 20,
                controller: textController,
                enabled: isEditable,
                keyboardType: inputType ?? TextInputType.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(headerText.contains('Name') ? 12 : 40),
                ],
                style: const TextStyle(fontSize: 14, color: inputFieldTextColor),
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: labelColor,
                    ),
                    filled: true,
                    fillColor: inputFieldBackgroundColor,
                    hintText: hintText,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      borderSide: BorderSide(color: cardColor, width: 0.1),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      borderSide: BorderSide(color: cardColor, width: 0.1),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                      borderSide: BorderSide(color: cardColor, width: 0.1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: cardColor, width: 0.1),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                    ),
                    suffixIcon: suffixIcon),
                onChanged: (value) {
                  onChange?.call(value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

RegExp lowerCase = RegExp(r"(?=.*[a-z])\w+");
RegExp upperCase = RegExp(r"(?=.*[A-Z])\w+");
RegExp containsNumber = RegExp(r"(?=.*?[0-9])");
RegExp hasSpecialCharacters = RegExp(r"[ !@#$%^&*()_+\-=\[\]{};':" "\\|,.<>\/?]");
