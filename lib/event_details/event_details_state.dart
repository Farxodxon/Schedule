import 'package:to_do/add_event/add_event_bloc.dart';

class EventDetailsState {
  AddEventState addEventState;
  String title;
  String subTitle;

  EventDetailsState({
    required this.addEventState,
    required this.title,
    required this.subTitle,
  });
}
