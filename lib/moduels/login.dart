import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/login_cubit/login_states.dart';
import 'package:shop_app/moduels/home_layout.dart';
import 'package:shop_app/moduels/register.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import '../cubit/cubit.dart';
import '../login_cubit/login_cubit.dart';
import '../shared/components/components.dart';

class loginScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var emailController=  TextEditingController();
    var passwordController=  TextEditingController();
    var formKey= GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context)=>loginCubit(),
      child: BlocConsumer<loginCubit,loginStates>(
        listener: (context , state){
          if(state is loginSucessState){
            if(state.loginmodel.status){
             // print(state.loginmodel.message);
             // print(state.loginmodel.data.token);
              cacheHelper.saveData(key:"token", value: state.loginmodel.data.token).then((value){
                token=state.loginmodel.data.token;
                navigateAndFinish(context, homeScreen());
              });

            }else{
              print(state.loginmodel.message);
              toast(
                  text: state.loginmodel.message,
                  state: toastState.ERROR
              );
            }
          }
        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding:const EdgeInsetsDirectional.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Login",style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 20,),
                          Text("Login now to browse our hot offers",style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),),
                          SizedBox(height: 40,),
                          defultFromField(
                              controller:emailController,
                              Type: TextInputType.emailAddress,
                              validator: (String value){
                                if(value.isEmpty){
                                  return "please enter your email";
                                }
                                return null;
                              },
                              label: "Email Address",
                              prefix:Icons.email_outlined),
                          SizedBox(height: 15,),
                          defultFromField(
                            controller: passwordController,
                            Type: TextInputType.visiblePassword,
                            validator:(String value){
                              if(value.isEmpty){
                                return "Please enter your password";
                              }
                              return null;
                            },
                            label: "Password",
                            prefix: Icons.lock,
                            suffix:loginCubit.get(context).suffixIcon,
                            isPassword: loginCubit.get(context).isPassword,
                            onSubmit: (value) {
                              if (formKey.currentState.validate()) {
                                loginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },

                            suffixPress: (){
                              loginCubit.get(context).loginPasswordShow();
                            },

                          ),
                          SizedBox(height: 20,),
                          ConditionalBuilder(
                              condition: state is! loginloadingState,
                              builder: (context)=>
                                  Container(
                                    width: double.infinity,
                                    color: Colors.blue,
                                    child: MaterialButton(
                                      onPressed:(){
                                        if(formKey.currentState.validate()){
                                          loginCubit.get(context).userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                          );
                                         //s print(emailController.text);
                                        }
                                      },
                                      child: Text("Login ".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),),
                                    ),
                                  ),
                              fallback: (context)=>Center(child: CircularProgressIndicator())),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                  onPressed:(){
                                    navigateTo(context, registerScreen());
                                  },
                                  child: Text("Register Now")),
                            ],
                          ),

                        ]),
                  ),
                ),
              ),
            ),


          );
        },
      ),
    );

  }
}