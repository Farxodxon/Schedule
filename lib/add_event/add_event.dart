import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/add_event/color_option.dart';
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
          colorOption: bloc.selectedColor,
        ),
        builder: (context, snapshot) {
          final state = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFFFFFFF),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 48,
                left: 24,
                right: 24,
                bottom: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "assets/icon_back.svg",
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Event name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    controller: bloc.nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      errorText: bloc.nameError,
                      fillColor: const Color(0xffF3F4F6),
                      focusColor: const Color(0xffF3F4F6),
                      hoverColor: const Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Event description",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    minLines: 5,
                    maxLines: 20,
                    controller: bloc.descriptionController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      errorText: bloc.descriptionError,
                      fillColor: const Color(0xffF3F4F6),
                      focusColor: const Color(0xffF3F4F6),
                      hoverColor: const Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Event location",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    controller: bloc.locationController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      suffixIcon: const SizedBox(
                          height: 17,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          )),
                      fillColor: const Color(0xffF3F4F6),
                      focusColor: const Color(0xffF3F4F6),
                      hoverColor: const Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Priority color",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButton(
                      value: bloc.selectedColor,
                      items: colorOptions.map<DropdownMenuItem<ColorOption>>(
                          (ColorOption colorOption) {
                        return DropdownMenuItem<ColorOption>(
                          value: colorOption,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: colorOption.color,
                              ),
                              const SizedBox(width: 10),
                              Text(colorOption.name),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        bloc.changeColor(value);
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Event time",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    controller: bloc.timeController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      filled: true,
                      errorText: bloc.timeError,
                      suffixIcon: const SizedBox(
                          height: 17,
                          child: Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          )),
                      fillColor: const Color(0xffF3F4F6),
                      focusColor: const Color(0xffF3F4F6),
                      hoverColor: const Color(0xffF3F4F6),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: const Color(0xffF3F4F6).withOpacity(0),
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
                    onTap: () async {
                      var datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(1999),
                        firstDate: DateTime(1960),
                        lastDate: DateTime.now(),
                      );

                      if (datePicked != null) {
                        print(
                            datePicked); //datePicked output format => 2021-03-10 00:00:00.000

                        //formatted date output using intl package =>  2021-03-16
                        bloc.timeController.text = datePicked
                            .toString(); //set output date to TextField value.
                      } else {}
                    },
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      bloc.addList(
                        AddEventState(
                          name: bloc.nameController.text,
                          description: bloc.descriptionController.text,
                          location: bloc.locationController.text,
                          colorOption: bloc.selectedColor,
                          dateTime: DateTime.parse(bloc.timeController.text),
                        ),
                        context,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF009FEE),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget getColorItem(Color color) {
    return Container(
      height: 24,
      width: 24,
      color: color,
    );
  }
}
