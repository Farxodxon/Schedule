import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/add_event/add_event_bloc.dart';
import 'package:to_do/event_details/event_details_bloc.dart';
import 'package:to_do/event_details/event_details_state.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key});

  final bloc = EventDetailsBloc();
  final routName = "/event_details";

  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)?.settings.arguments as AddEventState;

    return StreamBuilder(
        stream: bloc.stateStream,
        initialData: EventDetailsState(
          addEventState:arg?? AddEventState(
            name: "",
            location: "",
            description: "",
            dateTime: DateTime.now(),
            colorOption: bloc.selectedColor,
          ),
          title: '',
          subTitle: '',
        ),
        builder: (context, snapshot) {
          final state = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: getAppBar(context,state!.addEventState),
            backgroundColor: const Color(0xFFFFFFFF),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 48,
                left: 24,
                right: 24,
                bottom: 62,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Reminder",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "15 minutes befor",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF7C7B7B),
                    ),
                  ),
                  const SizedBox(height: 22,),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0xff999999),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFEE8E9),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/icon_delete.svg"),
                          const Text(
                            "Delete Event",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  getAppBar(BuildContext context, AddEventState addEventState) {
    return AppBar(
      toolbarHeight: 0,
      titleSpacing: 0,
      systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor: addEventState.colorOption.color,
        // <-- SEE HERE
        statusBarIconBrightness: Brightness.light,
        //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      backgroundColor: addEventState.colorOption.color,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(240),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 48,
            left: 28,
            right: 28,
            bottom: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        "assets/icon_left.svg",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/icon_edit.svg",
                        width: 14,
                        height: 14,
                      ),
                      const Text(
                        "Edit",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 6.5),
                child: Text(
                  addEventState.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  addEventState.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              getItem(
                '17:00 - 18:30',
                "assets/icon_time.svg",
              ),
              const SizedBox(
                height: 12,
              ),
             addEventState.location!=null? getItem(
                addEventState.location!,
                "assets/icon_location.svg",
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getItem(
    String title,
    String icon,
  ) {
    return Row(children: [
      SvgPicture.asset(
        icon,
        width: 17,
        color: Colors.white,
      ),
      Text(
        title,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      )
    ]);
  }
}
