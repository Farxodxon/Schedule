import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/calendar/calendar_bloc.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key});

  final bloc = AddEventBloc();
  final routName = "/add_event";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.stateStream,
        initialData: AddEventState(
          name: "",
          location: "",
          description: "",
          dateTime: DateTime.now(),
          color: bloc.selectedColor,
        ),
        builder: (context, snapshot) {
          final state = snapshot.data;
          return Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 48,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icon_back.svg",
                    width: 24,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Event name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      fillColor: Color(0xffF3F4F6),
                      focusColor: Color(0xffF3F4F6),
                      hoverColor: Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Event description",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    minLines: 5,
                    maxLines: 20,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      fillColor: Color(0xffF3F4F6),
                      focusColor: Color(0xffF3F4F6),
                      hoverColor: Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Event location",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      suffixIcon: SizedBox(
                          height: 17,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          )),
                      fillColor: Color(0xffF3F4F6),
                      focusColor: Color(0xffF3F4F6),
                      hoverColor: Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color(0xffF3F4F6).withOpacity(0),
                          width: 1,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Priority color",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  DropdownButton(
                      hint: dropDownMenuItem(Color(int.parse("0xff009FEE"))),
                      items: <String>[
                        "009FEE",
                        "EE2B00",
                        "EE8F00",
                      ].map<DropdownMenuItem<String>>((String color) {
                        return DropdownMenuItem<String>(
                          child: getColorItem(Color(int.parse("0xff$color"))),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // bloc.selectedColor = value;
                        bloc.changeColor(Color(int.parse("0xff$value")));
                      })
                ],
              ),
            ),
          );
        });
  }

  DropdownMenuItem dropDownMenuItem(Color color) {
    return DropdownMenuItem(
      value: color,
      child: getColorItem(color),
    );
  }

  Widget getColorItem(Color color) {
    return Container(
      height: 24,
      width: 24,
      color: color,
    );
  }
}
