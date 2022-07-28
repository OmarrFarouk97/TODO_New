
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:test2_algoriza/core/unit/blocs/app/states.dart';



class AppBloc extends Cubit<AppStates>{

  AppBloc() : super(AppInitialState());

  static AppBloc get (context)=> BlocProvider.of(context);

  final DatePickerController controller = DatePickerController();
  bool value = false;
  var dayController = TextEditingController();
  var dayMonthYearController = TextEditingController();


  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();

  String selectedColor= "Color(0XFFFF9D42)";

 bool firstSelectedColor =true;
  void firstSelectedColorItem ()
  {

    firstSelectedColor=true;
    secondSelectedColor=false;
    thirdSelectedColor=false;

    emit(ChangeSelectedColor());
  }

  bool secondSelectedColor =false;
  void secondSelectedColorItem ()
  {
    secondSelectedColor=true;
    firstSelectedColor=false;
    thirdSelectedColor=false;

    emit(ChangeSelectedColor());
  }

  bool thirdSelectedColor =false;
  void thirdSelectedColorItem ()
  {
    thirdSelectedColor=true;
    firstSelectedColor=false;
    secondSelectedColor =false;

    emit(ChangeSelectedColor());
  }

  //
  // bool isSelected = false;
  // void  isSelectedBox ()
  // {
  // isSelected=! isSelected;
  // emit(ChangeIsSelectedBox());
  // }


void changeTimeOfCalender()
{
  emit(ChangeTimeOfCalender());
}

//  bool valueOfCheckBox = false;
// void changeValueOfCheckBox()
// {
//   valueOfCheckBox=! valueOfCheckBox;
//   emit(ChangeValueOfCheckBox());
//
// }


String selectDateString = '';


  late Database database;

  List <Map> allTasks = [];
  List <Map> completedTasks = [];
  List <Map> uncompletedTasks = [];
  List <Map> favouriteTasks = [];


  void initDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'newTodoTask.db');
    debugPrint('AppDataBaseInitialized');

    openAppDataBase(path: path);

    emit(AppDataBaseInitialized());
  }



  void openAppDataBase({
  required String path
}) async {
     openDatabase(
         path,
         version: 1,
        onCreate: (Database db, int version) async {
          debugPrint('Table Created');

          await db.execute(
              'CREATE TABLE newTodoTask (id INTEGER PRIMARY KEY, title TEXT, date TEXT, start TEXT, end TEXT, remind TEXT, repeat TEXT, color TEXT, favorite TEXT, isCompleted TEXT)');
        },
        onOpen: (Database db) {
          debugPrint('AppDataBaseOpened');
          database = db;
          getUsersData();
        }
        );

  }









  void insertUsersData({
    String? remind,
    String? repeat,
    String? color,
  })
  {
    database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO newTodoTask (title, date, start, end, remind, repeat, color, favorite,isCompleted) VALUES("${titleController.text}" ,"${dateController.text}","${startTimeController.text}","${endTimeController.text}","$remind","$repeat","$selectedColor" ,"$favorite","$isSelectedCompleted")',
      );
     }).then((value) {
      debugPrint('user Data inserted');
      getUsersData();

      titleController.clear();
      dateController.clear();
      startTimeController.clear();
      endTimeController.clear();
      emit(AppDataBaseUserCreated());
     });
  }


  void getUsersData( )
  {

    database.rawQuery('SELECT * FROM newTodoTask').then((value) {
      allTasks.clear();
      completedTasks.clear();
      uncompletedTasks.clear();
      favouriteTasks.clear();


      value.forEach((element)
      {
        allTasks.add(element);
         if (element['isCompleted']== 'true') {
           completedTasks.add(element);
         } else if (element['isCompleted']== 'false') {
           uncompletedTasks.add(element);
         }
        if(element['favorite']== 'true') {
          favouriteTasks.add(element);
        }
      });
      emit(AppDataBaseUsers());
    });

  }





  List <Map> calender = [];
  void insertDataToSchedule(

  ){

    database.rawQuery('SELECT * FROM newTodoTask  WHERE date =?' , [selectDateString])
        .then((value) {
          calender=[];
      calender = value;
      emit(AppInsertDateToCalender());
    });
  }

  bool favorite = false;

  void updateFavorite({required String favoriteStatus, required int id,}) async
  {
   await database.rawUpdate(
      'UPDATE newTodoTask SET favorite = ? WHERE id = $id', [favoriteStatus]).then((value) {
      getUsersData();
      print(allTasks);

      emit(AppUpdateDatabaseFavorite());
    });
  }


bool isSelectedCompleted =false;

  void updateCompleted({required String completedStatus, required int id,}) async
  {
   await database.rawUpdate(
      'UPDATE newTodoTask SET isCompleted = ? WHERE id = $id', [completedStatus]).then((value) {
      getUsersData();
      print(allTasks);
      emit(AppUpdateDatabaseCompleted());
    });
  }


  void deleteData({
    required int id,
  }) async
  {

    database.rawDelete('DELETE FROM newTodoTask WHERE id = ?', [id]).
    then((value) {
      emit(AppDeletDatabaseState());
      getUsersData();
    });


  }




  String remind = "1 minutes before";

  void remindMethod({
 required String remindChanged,
}){
   remind= remindChanged;
  }






}