import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/unit/blocs/app/cubit.dart';
import '../../../../core/unit/blocs/app/states.dart';
import '../../../../core/unit/notification/notification.dart';
import '../../../../utils/styles/icon_broken.dart';
import '../../../shared_widgaets/input_field.dart';
import 'package:intl/intl.dart';
import '../../../shared_widgaets/my_buttom.dart';

class AddTaskScreen extends StatelessWidget {
  DateTime selectedDateTime = DateTime.now();

  List<DropdownMenuItem<String>> get remindItmes {
    List<DropdownMenuItem<String>> remindMenuItems = [
      const DropdownMenuItem(child: Text("1 minutes before"), value: "1 minutes before"),
      const DropdownMenuItem(
          child: Text("10 minutes before"), value: "10 minutes before"),
      const DropdownMenuItem(
          child: Text("30 minutes before"), value: "30 minutes before"),
      const DropdownMenuItem(
          child: Text("1 hour before"), value: "1 hour before"),
      const DropdownMenuItem(
          child: Text("1 day before"), value: "1 day before"),
    ];
    return remindMenuItems;
  }

  //var remind = "none";


  List<DropdownMenuItem<String>> get repeatItmes {
    List<DropdownMenuItem<String>> repeatMenuItems = [
      const DropdownMenuItem(child: Text("never"), value: "never"),
      const DropdownMenuItem(child: Text("Every day"), value: "Every day"),
      const DropdownMenuItem(child: Text("Every week"), value: "Every week"),
      const DropdownMenuItem(child: Text("Every month"), value: "Every month"),
    ];
    return repeatMenuItems;
  }

  var repeat = "never";

  final formKey = GlobalKey<FormState>();

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
              'Add task',
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
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Title',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'time must not be empty';
                          }
                          return null;
                        },
                        hint: "Enter your title",
                        type: TextInputType.text,
                        controller: AppBloc.get(context).titleController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Date must not be empty';
                          }
                          return null;
                        },
                        hint: DateFormat.yMd().format(selectedDateTime),
                        type: TextInputType.text,
                        controller: AppBloc.get(context).dateController,
                        suffix: const Icon(
                          IconBroken.Calendar,
                        ),
                        onTab: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2023-06-20'),
                          ).then((value) => {
                                AppBloc.get(context).dateController.text =
                                   // DateFormat.yMd().format(value!)

                                 //  DateFormat('M/d/yyyy').format(value!).toString()
                            DateFormat('yyyy-MM-dd').format(value!).toString()
                              });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Enter start time';
                                    }
                                    return null;
                                  },
                                  width: double.infinity,
                                  type: TextInputType.datetime,
                                  hint: DateFormat("hh:mm a").format(selectedDateTime),
                                  controller: AppBloc.get(context).startTimeController,
                                  suffix: const Icon(
                                    IconBroken.Time_Circle,
                                  ),
                                  onPressed: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      AppBloc.get(context).startTimeController.text = value!.format(context).toString();
                                    });
                                  },
                                  onTab: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      AppBloc.get(context).startTimeController.text =
                                          value!.format(context).toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'End time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Enter end time';
                                    }
                                    return null;
                                  },
                                  width: double.infinity,
                                  type: TextInputType.datetime,
                                  hint: DateFormat("hh:mm a")
                                      .format(selectedDateTime),
                                  controller:
                                      AppBloc.get(context).endTimeController,
                                  suffix: const Icon(IconBroken.Time_Circle),
                                  onPressed: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      AppBloc.get(context)
                                              .endTimeController
                                              .text =
                                          value!.format(context).toString();
                                    });
                                  },
                                  onTab: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      AppBloc.get(context)
                                              .endTimeController
                                              .text =
                                          value!.format(context).toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Remind',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.black12, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(

                              enableFeedback: true,
                              items: remindItmes,
                              isExpanded: true,
                              hint: Text(AppBloc.get(context).remind),
                              value: AppBloc.get(context).remind,
                              onChanged: ( String? newValue) {
                                AppBloc.get(context).remindMethod(remindChanged: newValue!);

                             //   remind = newValue!;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Repeat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.black12, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              enableFeedback: true,
                              items: repeatItmes,
                              isExpanded: true,
                              hint: Text(repeat),
                              value: repeat,
                              onChanged: (String? newSecondValue) {
                                repeat = newSecondValue!;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                           GestureDetector(
                              onTap: (){
                                AppBloc.get(context).firstSelectedColorItem();
                                AppBloc.get(context).selectedColor='Color(0XFFFF9D42)';

                              },
                              child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Color(0XFFFF9D42),
                                  child: Icon(
                                    Icons.done,
                                    color: AppBloc.get(context).firstSelectedColor
                                        ?Colors.white
                                        : Color(0XFFFF9D42),
                                    size: 16,
                                  )),
                            ),
                          const SizedBox(width:10 ,),
                           GestureDetector(
                              onTap: (){
                                AppBloc.get(context).secondSelectedColorItem();
                                AppBloc.get(context).selectedColor='Color(0XFFff5147)';

                              },
                              child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Color(0XFFff5147),
                                  child: Icon(
                                    Icons.done,
                                    color: AppBloc.get(context).secondSelectedColor
                                        ?Colors.white
                                        : Color(0XFFff5147),
                                    size: 16,
                                  )),
                            ),
                         const SizedBox(width:10 ,),
                          GestureDetector(
                              onTap: (){
                                AppBloc.get(context).thirdSelectedColorItem();
                                AppBloc.get(context).selectedColor='Color(0XFF42a0ff)';
                              },
                              child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Color(0XFF42a0ff),
                                  child: Icon(
                                    Icons.done,
                                    color: AppBloc.get(context).thirdSelectedColor
                                        ? Colors.white
                                        : Color(0XFF42a0ff),
                                    size: 16,
                                  )),
                            ),


                          const Spacer(),
                          MyButton(
                            onClick: () {
                              AppBloc.get(context).insertUsersData(
                                  color: AppBloc.get(context).selectedColor,
                                  remind: AppBloc.get(context).remind
                              );
                              if (AppBloc.get(context).remind == '1 minutes before') {
                                var date = DateFormat.jm().parse(
                                    AppBloc
                                        .get(context)
                                        .endTimeController
                                        .text);
                                var myTime = DateFormat('HH:mm').format(
                                    date.subtract(Duration(minutes: 1)));
                                int year = int.parse(AppBloc
                                    .get(context)
                                    .dateController
                                    .text
                                    .split('-')[0]);
                                int month = int.parse(AppBloc
                                    .get(context)
                                    .dateController
                                    .text
                                    .split('-')[1]);
                                int day = int.parse(AppBloc
                                    .get(context)
                                    .dateController
                                    .text
                                    .split('-')[2]);
                                createScheduledNotification(
                                  timeOfDayHour:
                                  int.parse(myTime.toString().split(':')[0]),
                                  timeOfDayMinute:
                                  int.parse(myTime.toString().split(':')[1]),
                                  day: day,
                                  month: month,
                                  year: year,
                                  title: AppBloc
                                      .get(context)
                                      .titleController
                                      .text,
                                  note: "I would like to remind you that the task will expire in 1 minutes.",
                                  week: 11,
                                );

                                Navigator.pop(context);
                              }
                              else if (AppBloc.get(context).remind == '10 minutes before') {
                                var date = DateFormat.jm().parse(
                                    AppBloc.get(context).endTimeController.text);
                                var myTime = DateFormat('HH:mm').format(
                                    date.subtract(Duration(minutes: 10)));
                                int year = int.parse(AppBloc.get(context).dateController.text.split('-')[0]);
                                int month = int.parse(AppBloc.get(context).dateController.text.split('-')[1]);
                                int day = int.parse(AppBloc.get(context).dateController.text.split('-')[2]);
                                createScheduledNotification(
                                  timeOfDayHour:
                                  int.parse(myTime.toString().split(':')[0]),
                                  timeOfDayMinute:
                                  int.parse(myTime.toString().split(':')[1]),
                                  day: day,
                                  month: month,
                                  year: year,
                                  title: AppBloc.get(context).titleController.text,
                                  note: "I would like to remind you that the task will expire in 10 minutes.",
                                  week: 11,
                                );
                                Navigator.pop(context);
                              }
                              else if (AppBloc.get(context).remind == '30 minutes before') {
                                var date = DateFormat.jm().parse(
                                    AppBloc.get(context).endTimeController.text);
                                var myTime = DateFormat('HH:mm').format(
                                    date.subtract(Duration(minutes: 30)));
                                int year = int.parse(AppBloc.get(context).dateController.text.split('-')[0]);
                                int month = int.parse(AppBloc.get(context).dateController.text.split('-')[1]);
                                int day = int.parse(AppBloc.get(context).dateController.text.split('-')[2]);
                                createScheduledNotification(
                                  timeOfDayHour:
                                  int.parse(myTime.toString().split(':')[0]),
                                  timeOfDayMinute:
                                  int.parse(myTime.toString().split(':')[1]),
                                  day: day,
                                  month: month,
                                  year: year,
                                  title: AppBloc.get(context).titleController.text,
                                  note: "I would like to remind you that the task will expire in 30 minutes.",
                                  week: 11,
                                );
                                Navigator.pop(context);
                              }
                              else if (AppBloc.get(context).remind== '1 hour before') {
                                var date = DateFormat.jm().parse(
                                    AppBloc.get(context).endTimeController.text);
                                var myTime = DateFormat('HH:mm').format(
                                    date.subtract(Duration(hours: 1)));
                                int year = int.parse(AppBloc.get(context).dateController.text.split('-')[0]);
                                int month = int.parse(AppBloc.get(context).dateController.text.split('-')[1]);
                                int day = int.parse(AppBloc.get(context).dateController.text.split('-')[2]);
                                createScheduledNotification(
                                  timeOfDayHour:
                                  int.parse(myTime.toString().split(':')[0]),
                                  timeOfDayMinute:
                                  int.parse(myTime.toString().split(':')[1]),
                                  day: day,
                                  month: month,
                                  year: year,
                                  title: AppBloc.get(context).titleController.text,
                                  note: "I would like to remind you that the task will expire in an hour.",
                                  week: 11,
                                );
                                Navigator.pop(context);
                              }
                              else if (AppBloc.get(context).remind == '1 day before') {
                              var date = DateFormat.jm().parse(
                              AppBloc.get(context).endTimeController.text);
                              var myTime = DateFormat('HH:mm').format(
                              date.subtract(Duration(days: 1)));
                              int year = int.parse(AppBloc.get(context).dateController.text.split('-')[0]);
                              int month = int.parse(AppBloc.get(context).dateController.text.split('-')[1]);
                              int day = int.parse(AppBloc.get(context).dateController.text.split('-')[2]);
                              createScheduledNotification(
                              timeOfDayHour:
                              int.parse(myTime.toString().split(':')[0]),
                              timeOfDayMinute:
                              int.parse(myTime.toString().split(':')[1]),
                              day: day,
                              month: month,
                              year: year,
                              title: AppBloc.get(context).titleController.text,
                              note: "I would like to remind you that the task will expire in a day.",
                              week: 11,);
                              Navigator.pop(context);

                              }

                            },
                            width: 200,
                            text: 'Add a task',
                            ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
