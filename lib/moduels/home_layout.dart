
   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/App_states.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/moduels/search_Screen.dart';
import 'package:shop_app/shared/components/components.dart';


class homeScreen  extends StatelessWidget {

     @override
     Widget build(BuildContext context) {
       return BlocConsumer<appCubit ,AppStates>(
         listener: (context ,state){},
       builder: (context, state){
         var cubit= appCubit.get(context);
           return Scaffold(
             appBar: AppBar(
               title: Text("Salla"),
               actions: [
                 IconButton(
                     onPressed:()
                     {
                       navigateTo(context, search_screen());
                     },
                     icon: Icon(Icons.search))
               ],
             ),
             body:cubit.bottomScreens[cubit.currentIndex] ,
             bottomNavigationBar:BottomNavigationBar(
               currentIndex: cubit.currentIndex,
               items: [
                 BottomNavigationBarItem(
             icon: Icon(Icons.home),
                   label: "Home"
                 ),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.apps),
                     label: "Categories"
                 ),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.favorite),
                     label: "Favorite"
                 ),
                 BottomNavigationBarItem(
                     icon: Icon(Icons.settings),
                     label: "Settings"
                 ),
               ],
               onTap: (index){
                 cubit.bottomChangeScreen(index);
               },
             )
           );
     });
       }
}
