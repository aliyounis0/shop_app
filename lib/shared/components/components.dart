import 'package:shop_app/shared/network/local/cache_helper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../moduels/login.dart';
import '../../moduels/on_boarding_screen.dart';

Widget buildBoardingItem (boardingModel model)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Image(
        image:NetworkImage("${model.image}"),
      ),
    ),
    SizedBox(height: 30,),
    Text("${model.title}",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),
    SizedBox(height: 30,),
    Text("${model.body}",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),),


  ],
);


void navigateTo (context,widgit)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>widgit),
);


void navigateAndFinish (context,widgit)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder:(context)=>widgit) ,
        (Route<dynamic> route) => false,
);

Widget defultFromField({
  @required TextEditingController controller,
  @required TextInputType Type,
  Function onSubmit,
  Function onChange,
  @required Function validator,
  @required  String label,
  @required IconData prefix,
  IconData suffix,
   bool isPassword=false,
  Function suffixPress,
}
    )=>TextFormField(
  controller:controller,
  keyboardType: Type,
  onChanged: onChange,
  onFieldSubmitted: onSubmit,
  validator: validator,
  obscureText: isPassword,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
    suffixIcon: suffix !=null?IconButton(
      onPressed:suffixPress,
      icon: Icon(suffix),
    ) :null ,
  ),
);


 void toast ({
  @required String text,
   @required toastState state,
})=> Fluttertoast.showToast(
     msg: text,
     toastLength: Toast.LENGTH_LONG,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 5,
     backgroundColor:toastColor(state),
     textColor: Colors.white,
     fontSize: 16.0
 );

 enum toastState {SUCCESS,ERROR,WARNING}


Color toastColor (toastState state){
   Color color;

   switch(state)
   {
     case toastState.SUCCESS:
       color=Colors.green;
       break;
     case toastState.ERROR:
       color=Colors.red;
       break;
     case toastState.WARNING:
       color=Colors.amber;
       break;
   }
   return color;
}

void signOut (context){
  cacheHelper.removeData("token").then((value)
  {
    if(value)   navigateTo(context, loginScreen());
  });
}


String token="";
