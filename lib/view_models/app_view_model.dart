

import 'package:flutter/material.dart';
import 'package:todolist/models/task_model.dart';
import 'package:todolist/models/user_model.dart';

class AppViewModel extends ChangeNotifier{
  List<Task> tasks=<Task>[];
  User user=User("John Snow");


  Color clrLvl1=Colors.grey.shade50;
  Color clrLvl2=Colors.grey.shade200;
  Color clrLvl3=Colors.grey.shade800;
  Color clrLvl4=Colors.grey.shade900;


  int get numTasks=>tasks.length;

  void updateUserName(String newUsername){
    user.username=newUsername;
    notifyListeners();
  }

  String get username=>user.username;

  void deleteAllTasks(){
    tasks.clear();
    notifyListeners();
  }
  void deleteCompleteTasks(){
    tasks=tasks.where((task) => !task.complete).toList();
  }


  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTakValue(int taskIndex){
    return tasks[taskIndex].complete;
  }
  int get numTasksRemaining=>tasks.where((task)=> !task.complete).length;

  String getTaskTitle(int taskIndex){
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
    notifyListeners();
  }
  void setTaskValue(int taskIndex,bool taskValue){
    tasks[taskIndex].complete=taskValue;
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView,BuildContext context){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer, context: context, builder: ((context){
      return bottomSheetView;

    }));
  }

}
