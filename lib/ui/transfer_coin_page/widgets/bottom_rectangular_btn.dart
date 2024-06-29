import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class BottomRectangularBtn extends StatelessWidget {
  const BottomRectangularBtn(
      {super.key,
      required this.onTapFunc,
      required this.btnTitle,
      this.isDisabled = false,
      this.isFilled = false,
      this.isLoading = false,
      this.loadingText = '',
      this.onlyBorder = false,
      this.color,
      this.buttonTextColor,
      this.hasIcon,
      this.svgName,
      this.svgColor,
      this.hasDoubleBorder});
  final Function onTapFunc;
  final String btnTitle;
  final bool isDisabled;
  final bool isFilled;
  final bool isLoading;
  final String loadingText;
  final Color? color;
  final Color? buttonTextColor;
  final bool? onlyBorder;
  final bool? hasIcon;
  final bool? hasDoubleBorder;
  final String? svgName;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
      onTap: () async {
        if (!isLoading == true) {
          onTapFunc.call();
        }
      },
      builder: (BuildContext context, TapDebouncerFunc? onTap) {
        return InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: onlyBorder == true
                ? BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10))
                : BoxDecoration(
                    color: color ??
                        (isDisabled ? color ?? primaryColor : primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isLoading)
                    SizedBox(
                      height: 28.0,
                      width: 28.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: onlyBorder == true ? primaryColor : Colors.white,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  if (isLoading) const SizedBox(width: 14),
                  Row(
                    children: [
                      if (hasIcon == true)
                        SvgPicture.asset(
                          'assets/svgs/$svgName.svg',
                          color: svgColor,
                        ),
                      if (hasIcon == true)
                        const SizedBox(
                          width: 8,
                        ),
                      Text(
                        isLoading ? loadingText : btnTitle,
                        style: TextStyle(
                          color: isDisabled
                              ? const Color(0xff9E9B9B)
                              : buttonTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
