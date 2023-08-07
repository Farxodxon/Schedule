import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/calendar/calendar_state.dart';

class CalendarBloc extends StateStreamableSource<CalendarState>{
  final _stateStreamController = StreamController<CalendarState>();

  Stream<CalendarState> get stateStream => _stateStreamController.stream;

  DateTime _selectedDate = DateTime.now();
  int daysInMonth = 31;

  void onDaySelected(DateTime date) {
    _selectedDate = date;
    _stateStreamController.add(_getCalendarState());
  }

  void previousMonth() {
    DateTime previousMonthDate =
        DateTime(_selectedDate.year, _selectedDate.month - 1);
    _selectedDate = previousMonthDate;
    getDaysInMonth();
    _stateStreamController.add(_getCalendarState());
  }

  void nextMonth() {
    DateTime previousMonthDate =
        DateTime(_selectedDate.year, _selectedDate.month + 1);
    _selectedDate = previousMonthDate;
    getDaysInMonth();
    _stateStreamController.add(_getCalendarState());
  }

  void previousYear() {
    // Shunga o'xshash ammo yilni o'zgartiramiz
  }

// Keyingi yil
  void nextYear() {
    // Yilni oshiraman
  }

  List<DateTime> getDateList(){
    List<DateTime> dateTimeList=[];

    for(var i=1;i<=daysInMonth;i++){
      dateTimeList.add(DateTime(_selectedDate.year,_selectedDate.month,i));
    }

    return dateTimeList;
  }
  List<int> getDayList(){
    List<int> days=[];
    DateTime time=DateTime(_selectedDate.year,_selectedDate.month,1);
    int weekDay=time.weekday%7;

    for(int i=0;i<42;i++){
      if(weekDay==i){
        days.addAll(getDateList().map((e) => e.day).toList());
      }else{
        days.add(0);
      }
    }

    return days;
  }

  CalendarState _getCalendarState() {
    return CalendarState(
        day: _selectedDate.day,
        month: _selectedDate.month,
        year: _selectedDate.year);
  }

  int getDaysInMonth() {
    if (_selectedDate.month == 2) {
      if ((_selectedDate.year % 4) == 0) {
        daysInMonth = 29;
      } else {
        daysInMonth = 28;
      }
    } else {
      if (_selectedDate.month == 1) {
        daysInMonth = 31;
      } else {
        if (_selectedDate.month == 3) {
          daysInMonth = 31;
        } else {
          if (_selectedDate.month == 4) {
            daysInMonth = 30;
          } else {
            if (_selectedDate.month == 5) {
              daysInMonth = 31;
            } else {
              if (_selectedDate.month == 6) {
                daysInMonth = 30;
              } else {
                if (_selectedDate.month == 7) {
                  daysInMonth = 31;
                } else {
                  if (_selectedDate.month == 8) {
                    daysInMonth = 31;
                  } else {
                    if (_selectedDate.month == 9) {
                      daysInMonth = 30;
                    } else {
                      if (_selectedDate.month == 10) {
                        daysInMonth = 31;
                      } else {
                        if (_selectedDate.month == 11) {
                          daysInMonth = 30;
                        } else {
                          if (_selectedDate.month == 12) {
                            daysInMonth = 31;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    return daysInMonth;
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
  CalendarState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<CalendarState> get stream => throw UnimplementedError();
}
