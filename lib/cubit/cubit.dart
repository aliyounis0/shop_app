import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/App_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/favourite_model.dart';
import 'package:shop_app/models/get_favourite_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/moduels/categories_Screen.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../moduels/favorites_Screen.dart';
import '../moduels/products_Screen.dart';
import '../moduels/settings_Screen.dart';
import '../shared/components/components.dart';
import '../shared/network/end_points.dart';

class appCubit extends Cubit<AppStates> {
  appCubit() : super(appInstialState());

  static appCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    products_screen(),
    categories_screen(),
    favorites_screen(),
    settings_screen(),
  ];

  void bottomChangeScreen(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  Map<int, bool> favourites = {};

  homeModel HomeModel;

  void getHomeData() {
    emit(loadingHomeDataState());
    dioHelper
        .getData(
      url: HOME,
      token: token,
    )
        .then((value) {
      // print(value);
      HomeModel = homeModel.fromJson(value.data);
      //  print(HomeModel.toString());
      HomeModel.data.products.forEach((element) {
        favourites.addAll({
          element.id: element.in_favorites,
        });
      });
    //  print(favourites.toString());
      emit(successHomeDataState());
    }).catchError((error) {
      print(error.toString());
      //HomeModel=homeModel.fromJson(value.data);
      //print(HomeModel.toString());
      emit(errorHomeDataState());
    });
  }

  categoriesModel CategoryModel;

  void getCatogeriesData() {
    dioHelper
        .getData(
      url: CATEGORIES,
      token: token,
    )
        .then((value) {
    //  print(value);
      CategoryModel = categoriesModel.fromJason(value.data);
      emit(successCatogeriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(errorCatogeriesState());
    });
  }

  FavouriteModel favouriteModel;

  void changeFavourite(int productId) {
    favourites[productId] = !favourites[productId];
    emit(changeFavouritesDataState());
    dioHelper
        .postData(
      url: FAVOURITE,
      data: {
        'product_id': productId,
      },
      token: token,
    )
        .then((value) {
      favouriteModel = FavouriteModel.fromJson(value.data);
      if (!favouriteModel.status) {
        favourites[productId] = !favourites[productId];
      } else {
        getFavouriteData();
      }
      emit(successFavouritesDataState());
    }).catchError((error) {
      emit(errorFavouritesDataState());
    });
  }

  FavouriteDataModel favouriteDataModel;

  void getFavouriteData() {
    emit(loadingGetFavouritesDataState());
    dioHelper
        .getData(
      url: FAVOURITE,
      token: token,
    )
        .then((value) {
      //print(value);
      favouriteDataModel = FavouriteDataModel.fromJson(value.data);
      emit(successGetFavouritesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(errorGetFavouritesDataState());
    });
  }


  loginUser userProfile;

  void getUserProfile() {
    emit(loadingGetUserprofileState());
    dioHelper
        .getData(
      url: PROFILE,
      token: token,
    )
        .then((value) {

      userProfile =loginUser.Formjson(value.data) ;
      emit(successGetUserprofileState(userProfile));
    }).catchError((error) {
      print(error.toString());
      emit(errorGetUserprofileState());
    });
  }
}
