import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do/add_event/color_option.dart';
import 'package:to_do/data.dart';

part 'add_event_event.dart';

part 'add_event_state.dart';
List<ColorOption> colorOptions = [
  ColorOption(name: 'Blue', color: const Color(0xff009FEE),textColor: const Color(0xff056EA1)),
  ColorOption(name: 'Red', color: const Color(0xffEE2B00),textColor: const Color(0xffBF2200)),
  ColorOption(name: 'Orange', color: const Color(0xffEE8F00),textColor: const Color(0xffBF2200)),
];
class AddEventBloc extends StateStreamableSource<AddEventState> {
  final _stateStreamController = StreamController<AddEventState>();

  Stream<AddEventState> get stateStream => _stateStreamController.stream;
  ColorOption selectedColor =colorOptions[0];
  final timeController=TextEditingController();
  final nameController=TextEditingController();
  final descriptionController=TextEditingController();
  final locationController=TextEditingController();

  String? nameError;
  String? descriptionError;
  String? timeError;

  changeColor(ColorOption? color) {
    selectedColor = color ??
        ColorOption(
          name: "Blue",
          color: const Color(0xff009FEE),
          textColor:  const Color(0xff056EA1)
        );
    _stateStreamController.add(_getEventState());
  }

  void addList(AddEventState addEventState,BuildContext context){
    if(validate()){
      events.add(addEventState);
      _stateStreamController.add(_getEventState());
      print("events add item evets lenght=${events.length}");
      Navigator.pop(context);
    }
  }
 bool validate(){
    bool isValid=false;

    if(nameController.text.isEmpty){
      nameError="Do not leave the field blank";
      isValid=false;
    }else{
      isValid=true;
      nameError=null;
    }
    if(descriptionController.text.isEmpty){
      descriptionError="Do not leave the field blank";
      isValid=false;
    }else{
      isValid=true;
      descriptionError=null;
    }
    if(timeController.text.isEmpty){
      timeError="Do not leave the field blank";
      isValid=false;
    }else{
      isValid=true;
      timeError=null;
    }
    _stateStreamController.add(_getEventState());
    return isValid;
  }

  AddEventState _getEventState() {
    return AddEventState(
      name: "",
      colorOption: selectedColor,
      dateTime: DateTime.now(),
      description: "",
      location: "",
    );
  }

  @override
  FutureOr<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  // TODO: implement state
  AddEventState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<AddEventState> get stream => throw UnimplementedError();
}
