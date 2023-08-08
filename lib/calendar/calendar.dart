import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/add_event/color_option.dart';
import 'package:to_do/calendar/calendar_bloc.dart';
import 'package:to_do/calendar/calendar_state.dart';
import 'package:to_do/data.dart';
import 'package:to_do/event_details/event_details_bloc.dart';

class Calendar extends StatelessWidget {
  final bloc = CalendarBloc();
  final routName = '/calendar';
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: bloc.stateStream,
        initialData: CalendarState(
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year),
        builder: (context, snapshot) {
          final state = snapshot.data;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark,
              //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 24,
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                getWeekday(DateTime(state?.year ?? 0,
                                        state?.month ?? 0, state?.day ?? 0)
                                    .weekday),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff292929),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state?.day ?? 0} ",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff292929),
                                    ),
                                  ),
                                  Text(
                                    getMonthName(state?.month ?? 0),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff292929),
                                    ),
                                  ),
                                  Text(
                                    " ${state?.year ?? 0}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff292929),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/icon_notifications.svg",
                          width: 28,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          getMonthName(state?.month ?? 0),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff292929),
                          ),
                          textAlign: TextAlign.start,
                        )),
                        CircleAvatar(
                            backgroundColor: const Color(0xFFEFEFEF),
                            radius: 12.5,
                            child: InkWell(
                                onTap: () => bloc.previousMonth(),
                                child: SvgPicture.asset("assets/icon_left.svg"))),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(0xFFEFEFEF),
                          radius: 12.5,
                          child: InkWell(
                            onTap: () => bloc.nextMonth(),
                            child: SvgPicture.asset("assets/icon_right.svg"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 7,
                      children: List.generate(7,
                          (index) => Text(getFirstThreeChars(getWeekday(index)))),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 42,
                      itemBuilder: (BuildContext context, int index) {
                        List<int> list = bloc.getDayList();
                        print("get list item ${list[index]}");
                        return InkWell(
                            onTap: list[index] != 0
                                ? () => bloc.onDaySelected(DateTime(
                                    state?.year ?? 0,
                                    state?.month ?? 0,
                                    list[index]))
                                : null,
                            child: Center(
                                child: Text(
                                    list[index] != 0 ? "${list[index]}" : "")));
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Schedule",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff292929),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/add_event',
                                arguments: AddEventBloc());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 22,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF009FEE),
                            ),
                            child: const Text(
                              "+ Add Event",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        3,
                        (index) => getItemEvent(
                          events[index],
                          context,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget getItemEvent(AddEventState addEventState, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/event_details', arguments: addEventState);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: addEventState.colorOption.color.withOpacity(0.2)),
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                    color: addEventState.colorOption.color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  top: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addEventState.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: addEventState.colorOption.textColor,
                      ),
                    ),
                    Text(
                      addEventState.description,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: addEventState.colorOption.textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        getItem(
                          addEventState.dateTime.hour.toString(),
                          "assets/icon_time.svg",
                          addEventState.colorOption.textColor,
                        ),
                        addEventState.location != null
                            ? getItem(
                                addEventState.location!,
                                "assets/icon_location.svg",
                                addEventState.colorOption.textColor,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getItem(
    String title,
    String icon,
    Color color,
  ) {
    return Row(children: [
      SvgPicture.asset(
        icon,
        width: 17,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      )
    ]);
  }

  String getWeekday(int index) {
    switch (index) {
      case 0:
        return "Sunday";
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      default:
        return "";
    }
  }

  String getFirstThreeChars(String str) {
    return str.substring(0, 3);
  }

  List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String getMonthName(int monthNumber) {
    return monthNames[monthNumber - 1];
  }

  final days = List.generate(31, (index) => index + 1);
}
