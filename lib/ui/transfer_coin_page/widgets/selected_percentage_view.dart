import 'package:flutter/material.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';

class SelectedPercentageView extends StatefulWidget {
  final Function(int) onChanged;
  const SelectedPercentageView({
    super.key,
    required this.onChanged,
  });

  @override
  State<SelectedPercentageView> createState() => SelectedPercentageViewState();
}

class SelectedPercentageViewState extends State<SelectedPercentageView> {
  int selectedPercentage = 0;

  void determineSelectedPercentage(int percentage) {
    setState(() {
      selectedPercentage = percentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.045;
    final width = MediaQuery.of(context).size.width * 0.16;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.042,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPercentage = 10;
                widget.onChanged(selectedPercentage);
              });
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                elevation: 0,
                color: selectedPercentage == 10 ? chipChoiceColor : lightColor,
                child: Center(
                  child: Text(
                    '10%',
                    style: TextStyle(
                      color: selectedPercentage == 10 ? primaryColor : inputFieldTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPercentage = 25;
                widget.onChanged(selectedPercentage);
              });
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                elevation: 0,
                color: selectedPercentage == 25 ? chipChoiceColor : lightColor,
                child: Center(
                  child: Text(
                    '25%',
                    style: TextStyle(
                      color: selectedPercentage == 25 ? primaryColor : inputFieldTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPercentage = 50;
                widget.onChanged(selectedPercentage);
              });
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                elevation: 0,
                color: selectedPercentage == 50 ? chipChoiceColor : lightColor,
                child: Center(
                  child: Text(
                    '50%',
                    style: TextStyle(
                      color: selectedPercentage == 50 ? primaryColor : inputFieldTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPercentage = 75;
                widget.onChanged(selectedPercentage);
              });
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                elevation: 0,
                color: selectedPercentage == 75 ? chipChoiceColor : lightColor,
                child: Center(
                  child: Text(
                    '75%',
                    style: TextStyle(
                      color: selectedPercentage == 75 ? primaryColor : inputFieldTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
