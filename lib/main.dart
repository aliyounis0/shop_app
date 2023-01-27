import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/App_states.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/moduels/login.dart';
import 'package:shop_app/moduels/on_boarding_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import 'moduels/home_layout.dart';
void main ()async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init ();
  await cacheHelper.init();
  Widget widgit;
  bool onBoarding= cacheHelper.getData(key:"onBoarding");
   token =cacheHelper.getData(key: "token");
   print(token);

  if(onBoarding !=null){
    if(token !=null) widgit= homeScreen();
    else widgit=loginScreen();
  }else {
    widgit = onBoardingScreen();
  }
  runApp(MyApp(
    startWidgit: widgit,
  ));

}



class MyApp extends StatelessWidget {
  final Widget startWidgit;
  MyApp({
    this.startWidgit,
  });

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>appCubit()..getHomeData()..getCatogeriesData()..getFavouriteData()..getUserProfile(),
      child: BlocConsumer<appCubit , AppStates>(
        listener: (context,state){},
        builder: (context ,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home:startWidgit,
          );
        },
      ),
    );
  }
}
