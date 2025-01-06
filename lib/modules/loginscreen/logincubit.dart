
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/layout/admin/admin_Layout_screen.dart';
import 'package:project/models/user_model.dart';
import 'package:project/shared/network/local/cache_helper.dart';

 import '../../layout/admin/admincubit/cubit.dart';
import '../../layout/doctor/doctor_Layout_screen.dart';
import '../../layout/doctor/doctorcubit/cubit.dart';
import '../../layout/student/Layout_screen.dart';
import '../../layout/student/studentcubit/cubit.dart';
import '../../layout/supervisor/supervisor_layout.dart';
import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'loginstates.dart';


class logincubit extends Cubit<loginstates>{
  logincubit() : super (loginIntialState());

  static logincubit get(context)=> BlocProvider.of(context);
  // var id;
   void userLogin({
    required String email,
    required String password,
  }) {
    emit(loginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
       // id= value.user!.uid;
      emit( loginSucessState(value.user!.uid));
    })
        .catchError((error)
    {
      emit(loginErrorState(error.toString()));
    });
  }
  IconData suffix =  IconBroken.Show;
  bool hidepass =true;
  void changepassvisibility(){
    hidepass=!hidepass;
    suffix=hidepass?IconBroken.Show :IconBroken.Hide;
    emit(chagePassvisibilitystate());

  }

  }

