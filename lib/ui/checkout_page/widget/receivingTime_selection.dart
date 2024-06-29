import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/checkout_page/cubit/checkout_page_cubit.dart';

import '../../../widgets/button.dart';

class ReceivingTimeSelection extends StatefulWidget {
  const ReceivingTimeSelection({super.key, required this.openingTime, required this.closingTime});
  final DateTime openingTime, closingTime;
  @override
  State<ReceivingTimeSelection> createState() => _ReceivingTimeSelectionState();
}

class _ReceivingTimeSelectionState extends State<ReceivingTimeSelection> {
  DateTime? initialDate;
  // List<DateTime> upcomingDays = [];

  DateFormat _dateFormat = DateFormat('EEEE MMM d');
  DateFormat _timeFormat = DateFormat('HH:mm');

  //List<DateTime> upcominghours = [];
  List<DateTime> upcominghoursToday = [];
  String? foodReceivingTime;
  bool forFirsttime = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setLocale();

    super.didChangeDependencies();
  }

  void setLocale() {
    var locale = Locale.fromSubtags(languageCode: Localizations.localeOf(context).languageCode);
    _dateFormat = DateFormat('EEEE MMM d', locale.toString());
    _timeFormat = DateFormat('HH:mm', locale.toString());
  }

  DateTime nearestHalf(DateTime val) {
    return DateTime(val.year, val.month, val.day, val.hour, [0, 30, 60][(val.minute / 30).round()]);
  }

  void timeGenerationForToday({required DateTime openingtime, required DateTime closingtime}) {
    upcominghoursToday = generateTimeList24(startTime: openingtime, endTime: closingtime);
  }

  List<DateTime> generateTimeList24({required DateTime startTime, required DateTime endTime}) {
    var now = DateTime.now();

    const interval = Duration(minutes: 30);

    List<DateTime> timeList = [];
    var currentTime = startTime;

    while (currentTime.isBefore(endTime)) {
      timeList.add(currentTime);
      currentTime = currentTime.add(interval);
    }
    if (now.isAfter(startTime) && now.isBefore(endTime)) {
      timeList.insert(0, now);
      timeList.removeWhere((time) => time.isBefore(now));
    }
    // remove the elements which are coming before current time within today
    timeList.sort((a, b) => a.compareTo(b));
    return timeList;
  }

  int selectedTimeindex = 0;
  int currentTimeindex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDelivery = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.isDelivery);
    bool donationOnly = context.select<CheckoutPageCubit, bool>((cubit) => cubit.state.donationOnly);

    if (donationOnly) return const SizedBox.shrink();

    return InkWell(
      onTap: () {
        timeGenerationForToday(openingtime: widget.openingTime, closingtime: widget.closingTime);

        _dateTimeSelector(context, isDelivery);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isDelivery ? context.l10n.checkout_page_delivery_schedule : context.l10n.checkout_page_pickup_schedule,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(foodReceivingTime ?? context.l10n.common_text_now),
                  const Icon(
                    CupertinoIcons.forward,
                    color: Colors.black54,
                  ),
                ],
              )
            ],
          ))),
    );
  }

  Future<dynamic> _dateTimeSelector(BuildContext context, bool isDelivery) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (BuildContext bc) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ButtonWidget(
                          onPressed: () async {
                            setState(() {
                              foodReceivingTime = _timeFormat.format(upcominghoursToday[selectedTimeindex]);
                            });

                            // 2020-01-02 03:04:05.000
                            context.read<CheckoutPageCubit>().receivingTimeChanged(DateTime(
                                upcominghoursToday[selectedTimeindex].year,
                                upcominghoursToday[selectedTimeindex].month,
                                upcominghoursToday[selectedTimeindex].day,
                                upcominghoursToday[selectedTimeindex].hour,
                                upcominghoursToday[selectedTimeindex].minute));
                            Navigator.pop(context);
                            // }
                          },
                          text: context.l10n.common_text_save),
                    ),
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                            ))),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoTheme(
                        data: CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            primaryColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                            initialItem: selectedTimeindex,
                          ),
                          magnification: 1.1,
                          itemExtent: 32.0,
                          // diameterRatio:10.0,
                          // offAxisFraction: 0.5,
                          onSelectedItemChanged: (int index) {
                            selectedTimeindex = index;
                          },
                          children: upcominghoursToday.map((DateTime option) {
                            return Text(
                              option.second == DateTime.now().second ? context.l10n.common_text_now : _timeFormat.format(option),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
