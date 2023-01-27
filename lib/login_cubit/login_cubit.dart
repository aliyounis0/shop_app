import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login_cubit/login_states.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../shared/network/end_points.dart';


class loginCubit extends Cubit<loginStates>{

  loginCubit():super(loginInitialState());
  static loginCubit get(contex)=>BlocProvider.of(contex);

  loginUser loginModel;


  void userLogin ({
  @required String email,
    @required String password,
})
  {
    emit(loginloadingState());

    dioHelper.postData(
        url: LOGIN,
        data:{
          "email":email ,
          "password":password ,
        }
    ).then((value)
    {
     // print(value.data);
      loginModel= loginUser.Formjson(value.data);
      emit(loginSucessState(loginModel));
    }).catchError((error)
    {
      emit(loginErrorState(error.toString())) ;
      print(error.toString());
    });
  }
bool isPassword=true;
 IconData  suffixIcon= Icons.remove_red_eye_outlined;

 void loginPasswordShow (){
   isPassword=!isPassword;
   suffixIcon= isPassword?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined ;
   emit(loginPasswordShowState());
 }
}