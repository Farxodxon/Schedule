import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/add_event/add_event.dart';
import 'package:to_do/add_event/add_event_bloc.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (_) => AddEventBloc(),
      child: AddEvent(),
    );
  }
}