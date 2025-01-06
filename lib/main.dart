import 'dart:convert';

import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_admin/src/auth/credential.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project/layout/admin/admincubit/cubit.dart';
import 'package:project/modules/splashscreen.dart';
import 'package:project/shared/components/blocobserver.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:project/shared/styles/themes.dart';

import 'layout/doctor/doctorcubit/cubit.dart';
import 'layout/student/studentcubit/cubit.dart';
import 'layout/supervisor/supervisorcubit/cubit.dart';
// import 'package:tflite_flutter/tflite_flutter.dart' as tfl ;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final interpreter = await Interpreter.fromAsset('assets/DentalModel4oEpochs.tflite');
  await dotenv.load(fileName: ".env");

  admin = FirebaseAdmin.instance.initializeApp(AppOptions(
    credential: ServiceAccountCredential.fromJson(
        json.decode(dotenv.env['FIREBASE_ADMIN_CREDENTIALS']!)),
  ));

  await Firebase.initializeApp();
  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();
  ROLE = cacheHelper.getdata(key: 'role');
  UID = cacheHelper.getdata(key: 'uId');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => adminLayoutcubit()
              ..getStudents()
              ..getDoctors()
              ..getSupervisors()),
        BlocProvider(
            create: (context) => studentLayoutcubit()
              ..getStudentData()
              ..studentGetCases()
              ..getRequestedCases()),
        BlocProvider(
            create: (context) => doctorLayoutcubit()
              ..getDoctorData()
              ..docotrGetCases()
              ..loadClassifier()),
        BlocProvider(
            create: (context) => supervisorLayoutcubit()
              ..getSupervisorData()
              ..supervisorGetCases()
              ..getAllDoctors()
              ..getRequestedCases()),
      ],
      child: MaterialApp(
        theme: lighttheme, // lightmode
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,

        home: splashScreen(),
      ),
    );
  }
}
