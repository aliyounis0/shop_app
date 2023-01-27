import 'package:shop_app/models/login_model.dart';

abstract class loginStates {}

class loginInitialState extends loginStates{}

class loginloadingState extends loginStates{}

class loginSucessState extends loginStates{
  final loginUser loginmodel;
  loginSucessState(this.loginmodel);
}

class loginErrorState extends loginStates{
  final String error;
      loginErrorState(this.error);
}

class loginPasswordShowState extends loginStates{}

