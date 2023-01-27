

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/App_states.dart';
import '../cubit/cubit.dart';
import '../models/categories_model.dart';

class categories_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state) {
        return ListView.separated(
            itemBuilder: (context,index)=>CategoryBuilder(appCubit.get(context).CategoryModel.data.data[index]),
            separatorBuilder: (context,index)=>separatorBuilder(),
            itemCount: appCubit.get(context).CategoryModel.data.data.length);
      }
            );
  }

  Widget CategoryBuilder (dataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: ConditionalBuilder(
        condition: dataModel !=null,
        builder:(context)=>Row(
          children: [
            Image(
              image: NetworkImage(model.image),
              width: 80,
              height: 80,
             // fit: BoxFit.cover,
            ),
            SizedBox(width: 20,),
            Text(model.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ],
        ),
        fallback:(context)=>Center(child: CircularProgressIndicator()),),
  );
}

Widget separatorBuilder()=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(
    children: [
      Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    ],
  ),
);