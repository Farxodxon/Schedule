import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/calendar/calendar.dart';
import 'package:to_do/calendar/calendar_bloc.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (_) => CalendarBloc(),
      child: Calendar(),
    );
  }
}