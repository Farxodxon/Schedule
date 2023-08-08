
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/event_details/event_details.dart';
import 'package:to_do/event_details/event_details_bloc.dart';
import 'package:to_do/event_details/event_details_event.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (_) => EventDetailsBloc(),
      child: EventDetails(),
    );
  }
}