import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/App_states.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/shared/components/components.dart';

class settings_screen extends StatelessWidget {
var nameController =TextEditingController();
var emailController =TextEditingController();
var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var model=appCubit.get(context).userProfile;
        nameController.text=model.data.name;
        emailController.text=model.data.email;
        phoneController.text=model.data.phone;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defultFromField(
                controller: nameController,
                Type: TextInputType.name,
                validator: (String value){
                  if(value.isEmpty){
                    return "Name is required";
                  }else
                    return null;
                },
                label: "Name",
                prefix: Icons.person,
              ),
              SizedBox(height: 20.0,),
              defultFromField(
                controller: emailController,
                Type: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return "Name is required";
                  }else
                    return null;
                },
                label: "Email",
                prefix: Icons.email_outlined,
              ),
              SizedBox(height: 20.0,),
              defultFromField(
                controller: phoneController,
                Type: TextInputType.phone,
                validator: (String value){
                  if(value.isEmpty){
                    return "Name is required";
                  }else
                    return null;
                },
                label: "Phone",
                prefix: Icons.phone,
              ),
              SizedBox(height: 25,),
              ConditionalBuilder(
                  condition: state is! loadingGetUserprofileState,
                  builder: (context)=>
                      Container(
                        width: double.infinity,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed:(){
                         signOut(context);
                          },
                          child: Text("Logout".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),),
                        ),
                      ),
                  fallback: (context)=>Center(child: CircularProgressIndicator())),
            ],
          ),
        );
      },
    );
  }
}
