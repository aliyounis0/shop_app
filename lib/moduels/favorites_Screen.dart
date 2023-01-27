import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/moduels/categories_Screen.dart';

import '../cubit/App_states.dart';
import '../models/get_favourite_model.dart';

class favorites_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<appCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: state is! loadingGetFavouritesDataState,
          builder:(context)=> ListView.separated
            (
            itemBuilder:(context,index)=>favBuilderItem(appCubit.get(context).favouriteDataModel.data.data[index],context),
            separatorBuilder:(context,index)=> separatorBuilder(),
            itemCount:appCubit.get(context).favouriteDataModel.data.data.length ,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget favBuilderItem(Data1 model,context)=>Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    height: 120,
    child: Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          height: 100,
          width: 110,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(image:NetworkImage(model.product.image),

                height:100,

                width:100,

              ),
              if(1!=0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,),
                  color: Colors.red,
                  child: Text("DISCOUNT",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),),
                ),
            ],
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.product.name,

                maxLines: 2,

                overflow: TextOverflow.ellipsis,

                style: TextStyle(

                  fontSize: 14,

                  height: 1.3,



                ),

              ),

              Row(

                children: [

                  Text(
                        "${model.product.price}",

                    style: TextStyle(

                      fontSize: 12,

                      color: Colors.blue,



                    ),

                  ),

                  SizedBox(width: 5.0,),
                  if(model.product.discount!=0)
                    Text( "${model.product.oldPrice}",
                      style: TextStyle(

                        fontSize: 12,

                        color: Colors.grey,

                        decoration: TextDecoration.lineThrough,

                      ),

                    ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      appCubit.get(context).changeFavourite(model.product.id);
                     //  appCubit.get(context).getFavouriteData();
                    },
                    icon:CircleAvatar(
                        radius: 15.0,
                      backgroundColor:appCubit.get(context).favourites[model.product.id]? Colors.blue : Colors.grey,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        )),
                  ),

                ],

              ),
            ],
          ),
        ),





      ],

    ),
  );
}
