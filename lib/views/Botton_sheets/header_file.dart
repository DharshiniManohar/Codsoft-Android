import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_models/app_view_model.dart';
import 'package:todolist/views/Botton_sheets/delete_bottom.dart';
import 'package:todolist/views/Botton_sheets/setting.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context,viewModel,child){
      return Row(
        children: [Expanded(flex:3,child: Column(children: [FittedBox(
          fit: BoxFit.fitHeight,
          child: Text("Welcome back,",style:TextStyle
          (fontSize: 23,fontWeight: FontWeight.w600,
          color: viewModel.clrLvl4)),
        ),
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(viewModel.username,style: TextStyle(fontSize: 36,
          fontWeight: FontWeight.bold,color: viewModel.clrLvl4),))],)),
        Expanded(flex:1,
        child: InkWell(
          onTap: (){
            viewModel.bottomSheetBuilder(DeleteBottomView(), context);
          },
          child: Icon(Icons.delete,color: viewModel.clrLvl3,size: 40,))),
          Expanded(flex:1,
        child: InkWell(
          onTap: (){
            viewModel.bottomSheetBuilder(SettingsBottomView(), context);
          },
          child: Icon(Icons.settings,color: viewModel.clrLvl3,size: 40,))),
        
        ],

      );
    });
  }
}