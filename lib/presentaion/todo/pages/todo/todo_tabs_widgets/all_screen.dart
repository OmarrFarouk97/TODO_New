import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/unit/blocs/app/cubit.dart';
import '../../../../../core/unit/blocs/app/states.dart';
import '../../../../../core/unit/shared_widgets/my_buttom.dart';
import '../../../../../utils/const/const.dart';
import '../../addTask/addTask_screen.dart';
import '../user_item/user_itmes.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 520,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: AppBloc.get(context).allTasks.length,
                  itemBuilder: (BuildContext context, int index) =>
                      UserItem(item: AppBloc.get(context).allTasks[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    width: double.infinity,
                    height: 5,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              MyButton(
                onClick: () {
                  navigateTo(context, AddTaskScreen());
                },
                text: "Add a task",
                width: 350,
                colorMaterialButton: const Color(0xFF25c06d),
              ),
            ],
          ),
        );
      },
    );
  }
}
