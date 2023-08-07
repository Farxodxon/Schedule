import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_event_event.dart';

part 'add_event_state.dart';

class AddEventBloc extends StateStreamableSource<AddEventState> {
  final _stateStreamController = StreamController<AddEventState>();

  Stream<AddEventState> get stateStream => _stateStreamController.stream;
  Color selectedColor = Color(0xFF009FEE);

  changeColor(Color color) {
    selectedColor = color;
    _stateStreamController.add(_getEventState());
  }

  AddEventState _getEventState() {
    return AddEventState(
      name: "",
      color: selectedColor,
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
