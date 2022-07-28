import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/unit/blocs/app/cubit.dart';
import '../../../../../core/unit/blocs/app/states.dart';
import '../user_item/user_itmes.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
                itemCount: AppBloc.get(context).completedTasks.length,
                itemBuilder: (BuildContext context, int index) =>
                    UserItem(item: AppBloc.get(context).completedTasks[index]),
                separatorBuilder: (BuildContext context, int index) => Container(
                      width: double.infinity,
                      height: 5,
                      color: Colors.white,
                    )),
          );
        });
  }
}
