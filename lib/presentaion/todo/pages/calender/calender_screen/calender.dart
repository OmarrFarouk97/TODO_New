import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/unit/blocs/app/cubit.dart';
import '../../../../../core/unit/blocs/app/states.dart';
import '../../../../../utils/styles/icon_broken.dart';
import '../calender_item/calender_item.dart';

class CalenderScreen extends StatelessWidget {


    DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: const Text(
              'Schedule',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow___Left_2,
              ),
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: DatePicker(
                            DateTime.now(),
                            width: 60,
                            height: 80,
                            controller: AppBloc.get(context).controller,
                            initialSelectedDate: selectedDate,
                            selectionColor: Colors.green,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              selectedDate=date;
                              AppBloc.get(context).selectDateString=DateFormat("yyyy-MM-dd").format(selectedDate);
                              AppBloc.get(context).insertDataToSchedule();



                              AppBloc.get(context).changeTimeOfCalender();
                              AppBloc.get(context).dayController.text =
                                  DateFormat('EEEE').format(date);
                              AppBloc.get(context).dayMonthYearController.text =
                                  DateFormat("dd MMMM, yyyy").format(date);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black26,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(AppBloc.get(context).dayController.text),
                      const Spacer(),
                      Text(
                        AppBloc.get(context).dayMonthYearController.text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: AppBloc.get(context).calender.length,
                    itemBuilder: (BuildContext context, int index) =>
                       CalenderItem(item: AppBloc.get(context).calender[index]),
                    separatorBuilder: (BuildContext context, int index) => Container(
                      width: double.infinity,
                      height: 5,
                      color: Colors.white,
                    ),

                  ),
                  //CalenderItem(item:tasks)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
