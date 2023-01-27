import 'package:shop_app/models/login_model.dart';

abstract class AppStates {}

class appInstialState extends AppStates{}

class BottomNavState extends AppStates{}

class loadingHomeDataState extends AppStates{}

class successHomeDataState extends AppStates{}

class errorHomeDataState extends AppStates{}

class successCatogeriesDataState extends AppStates{}

class errorCatogeriesState extends AppStates{}

class successFavouritesDataState extends AppStates{}

class errorFavouritesDataState extends AppStates{}

class changeFavouritesDataState extends AppStates{}

class loadingGetFavouritesDataState extends AppStates{}

class successGetFavouritesDataState extends AppStates{}

class errorGetFavouritesDataState extends AppStates{}

class loadingGetUserprofileState extends AppStates{}

class successGetUserprofileState extends AppStates{
  final loginUser userProfile;

  successGetUserprofileState(this.userProfile);
}

class errorGetUserprofileState extends AppStates{}





