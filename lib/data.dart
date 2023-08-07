import 'package:flutter/material.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/add_event/color_option.dart';

List<AddEventState> events = [
  AddEventState(
    name: "Watching Football ",
    description: "Manchester United vs Arsenal (Premiere League)",
    location: "Stamford Bridge",
    colorOption: ColorOption(
        name: "Blue", color: Color(0xFF009FEE), textColor: Color(0xFF056EA1)),
    dateTime: DateTime.now(),
  ),
  AddEventState(
    name: "Deadline Project UI Website",
    description: "Profile Page, Cart, and Wishlist.",
    location: null,
    colorOption: ColorOption(
        name: "Red", color: Color(0xFFEE2B00), textColor: Color(0xFFBF2200)),
    dateTime: DateTime.now(),
  ),
  AddEventState(
    name: "Meeting Client (Japan)",
    description: "Android apps and website online shop",
    location: null,
    colorOption: ColorOption(
        name: "Blue", color: Color(0xFFEE8F00), textColor: Color(0xFFB86E00)),
    dateTime: DateTime.now(),
  ),
];
