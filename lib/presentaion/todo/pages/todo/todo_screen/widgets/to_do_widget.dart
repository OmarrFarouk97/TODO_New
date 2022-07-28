import 'package:flutter/material.dart';

import '../../todo_tabs_screen/all_screen.dart';
import '../../todo_tabs_screen/completed_screen.dart';
import '../../todo_tabs_screen/favorite_screen.dart';
import '../../todo_tabs_screen/uncompleted_screen.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState(

  );
}

class _TodoWidgetState extends State<TodoWidget> with TickerProviderStateMixin {
  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          labelPadding: EdgeInsets.only(),
          indicatorWeight: 2,
          unselectedLabelColor: Colors.black38,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black,
          controller: tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
            Tab(text: 'Uncompleted'),
            Tab(text: 'Favorite'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          AllScreen(),
          CompletedScreen(),
          UnCompletedScreen(),
          FavoriteScreen(),

        ],
      ),
    );
  }
}
