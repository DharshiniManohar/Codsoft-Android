import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context,viewModel,child){
      return Container(
        margin:EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            Expanded(
              flex:1,
              child: Container(
                decoration: BoxDecoration(color:viewModel.clrLvl2,borderRadius: BorderRadius.circular(10)),
                child:Column(children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(child: Text("${viewModel.numTasks}",style: TextStyle(fontSize: 28,color:viewModel.clrLvl3,fontWeight: FontWeight.bold),))),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: FittedBox(child: Text("Total Tasks",style: TextStyle(color: viewModel.clrLvl4,fontWeight: FontWeight.w500),)))
                ],)
              ),
            ),
            SizedBox(width: 20,),
        
            Expanded(
              flex:1,
              child: Container(
                decoration: BoxDecoration(color:viewModel.clrLvl2,borderRadius: BorderRadius.circular(10)),
                child:Column(children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(child: Text("${viewModel.numTasksRemaining}",style: TextStyle(fontSize: 28,color:viewModel.clrLvl3,fontWeight: FontWeight.bold),))),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: FittedBox(child: Text("Remaining",style: TextStyle(color: viewModel.clrLvl4,fontWeight: FontWeight.w500),)))
                ],)
              ),
            ),
          ],
        ),
      );
    });
  }
}