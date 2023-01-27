

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/App_states.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';

class products_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,AppStates>(
        listener:(context ,state){},
      builder:(context , state){
          return ConditionalBuilder(
            condition: appCubit.get(context).HomeModel!=null && appCubit.get(context).CategoryModel!=null,
            builder:(context)=>productBuilder(appCubit.get(context).HomeModel ,appCubit.get(context).CategoryModel,context),
            fallback:(context)=>Center(child: CircularProgressIndicator()),
          );
      },
    );
  }


  Widget productBuilder(homeModel model,categoriesModel model2,context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        //color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CarouselSlider(
               items: model.data.banners.map((e) =>Image(
                 image:NetworkImage("${e.image}"),
                 width: double.infinity,
                 fit: BoxFit.cover,
               ),).toList(),
               options: CarouselOptions(
                 height: 250,
                 initialPage: 0,
                 viewportFraction: 1.0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayAnimationDuration: Duration(seconds: 1),
                 autoPlayInterval: Duration(seconds: 3),
                 autoPlayCurve: Curves.fastOutSlowIn,
                 scrollDirection: Axis.horizontal,
               ),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Catogeries",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),),
                  SizedBox(height: 5,),
                  Container(
                    height: 120,
                    child:ListView.separated(
                      physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index)=> categBuilderItem(model2.data.data[index]),
                        separatorBuilder: (context,index)=>SizedBox(width: 10,),
                        itemCount:model2.data.data.length,
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  Text("New Product",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1/1.58,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                children:
                  List.generate(
                      model.data.products.length,
                          (index) =>buildGredItem(model.data.products[index],context) ),
              ),
            ),

          ],
        ),
      ),
    );
  }
Widget  buildGredItem(productModel model,context)=>Container(
  color: Colors.white,
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(image:NetworkImage(model.image),

            height: 200,

            width: double.infinity,

          ),
          if(model.discount!=0)
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

      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("${model.name}",

              maxLines: 2,

              overflow: TextOverflow.ellipsis,

              style: TextStyle(

                fontSize: 14,

                height: 1.3,



              ),

            ),

            Row(

              children: [

                Text("${model.price}",

                  style: TextStyle(

                    fontSize: 12,

                    color: Colors.blue,



                  ),

                ),

                SizedBox(width: 5.0,),
                if(model.discount!=0)
                Text("${model.old_price}",

                  style: TextStyle(

                    fontSize: 12,

                    color: Colors.grey,

                    decoration: TextDecoration.lineThrough,

                  ),

                ),
                Spacer(),
                IconButton(
                    onPressed: (){
                      appCubit.get(context).changeFavourite(model.id);
                      print(model.id);
                     // appCubit.get(context).getFavouriteData();
                    },
                    icon:CircleAvatar(
                      radius: 15.0,
                        backgroundColor:appCubit.get(context).favourites[model.id]? Colors.blue : Colors.grey,
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

  Widget categBuilderItem(dataModel model)=>Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image:NetworkImage(model.image),
        height: 120,
        width: 120,
      ),
      Container(
        width: 120,
        color: Colors.black.withOpacity(.7),
        child: Text(model.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
    ],
  ) ;

}
