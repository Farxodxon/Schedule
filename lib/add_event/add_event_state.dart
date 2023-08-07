part of 'add_event_bloc.dart';


class AddEventState {
  String name;
  String description;
  String location;
  Color color;
  DateTime dateTime;

  AddEventState({
    required this.name,
    required this.description,
    required this.location,
    required this.color,
    required this.dateTime,
  });
}
