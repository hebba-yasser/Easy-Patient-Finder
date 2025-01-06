import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

import 'doctorcubit/cubit.dart';
import 'doctorcubit/states.dart';

class doctorLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<doctorLayoutcubit, doctorLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = doctorLayoutcubit.get(context);
        return Scaffold(
          /*  appBar: AppBar(
            title:  Text('EasyPatientFinder',),
            actions: [
              IconButton(onPressed: (){
                //  navigateto(context, searchScreen()),
              },
                icon:Icon(
                    IconBroken.Search), ),
              IconButton(onPressed: (){
                logout(context);
              },

                icon:Icon( IconBroken.Logout), )
            ],
          ),*/
          body: cubit.doctorbottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Paper_Plus),
                label: 'new Case',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Profile),
                label: 'Profile',
              ),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changebottomdoctor(index);
            },
          ),
        );
      },
    );
  }
}
