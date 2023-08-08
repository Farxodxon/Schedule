import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/add_event/add_event.dart';
import 'package:to_do/calendar/calendar.dart';
import 'package:to_do/event_details/event_details.dart';
import 'package:to_do/event_details/event_details_bloc.dart';
import 'package:to_do/theme_cubit.dart';

class AppView extends StatelessWidget {
  /// {@macro app_view}
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home:  Calendar(),
          routes: {
            Calendar().routName: (context) => Calendar(),
            AddEvent().routName: (context) => AddEvent(),
            EventDetails().routName: (context) => EventDetails(),
          },
        );
      },
    );
  }
}
