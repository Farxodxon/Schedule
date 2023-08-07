import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app.dart';
import 'package:to_do/app_bloc_ob_server.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const App());
}
