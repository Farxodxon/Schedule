import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/add_event/color_option.dart';
import 'package:to_do/event_details/event_details_state.dart';

class EventDetailsBloc extends StateStreamableSource<EventDetailsState> {
  final _stateStreamController = StreamController<EventDetailsState>();

  Stream<EventDetailsState> get stateStream => _stateStreamController.stream;
  ColorOption selectedColor =colorOptions[0];

  changeColor(ColorOption? color) {
    selectedColor = color ??
        ColorOption(
            name: "Blue",
            color: const Color(0xff009FEE),
            textColor:  const Color(0xff056EA1)
        );
    _stateStreamController.add(_getEventState());
  }
  EventDetailsState _getEventState() {
    return EventDetailsState(
    addEventState: AddEventState(
      name: "",
      location: "",
      description: "",
      dateTime: DateTime.now(),
      colorOption: selectedColor,
    ), title: '', subTitle: '',
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
  EventDetailsState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<EventDetailsState> get stream => throw UnimplementedError();
}
