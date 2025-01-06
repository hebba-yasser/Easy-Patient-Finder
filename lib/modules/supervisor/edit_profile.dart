
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/shared/styles/colors.dart';

import '../../shared/components/components.dart';

class supervisorEditProfileScreen extends StatelessWidget {
  var namecon = TextEditingController();
  var phonecon = TextEditingController();
  var emailcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cc.defcol,
        title: Center(
          child: Text('Edit profile',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconBroken.Arrow___Left_2, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check, color: Colors.white),
          )
        ],
      ),
      body: Container(
        color: defaultcol,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: defaultcol,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(height: 70,),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          CircleAvatar(
                            radius: 54.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20.0,
                              child: Icon(
                                IconBroken.Camera,
                                size: 16.0,
                              ),
                            ),
                            onPressed: () {
                              //  SocialCubit.get(context).getCoverImage();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    topEnd: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //if (SocialCubit.get(context).profileImage != null)
                              Expanded(
                                child: Column(
                                  children: [
                                    defaultbutton(
                                      onpress: () {
                                        /* SocialCubit.get(context).uploadProfileImage(
    name: nameController.text,
    phone: phoneController.text,
    bio: bioController.text,
    );*/
                                      },
                                      text: 'upload profile image',radius: 30,
                                    ),
                                    // if (state is SocialUserUpdateLoadingState)
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    //   if (state is SocialUserUpdateLoadingState)
                                    LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                            ],
                          ),
                          /*if (SocialCubit.get(context).profileImage != null ||
    SocialCubit.get(context).coverImage != null)*/
                          SizedBox(
                            height: 20.0,
                          ),
                          defaulttextformfield(
                            controller: namecon,
                            radius: 30,
                            keyboardtype: TextInputType.name,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                            },
                            label: 'Name',
                            prefix: IconBroken.User,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaulttextformfield(
                            controller: emailcon,
                            radius: 30,
                            keyboardtype: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email must not be empty';
                              }
                            },
                            label: 'Email',
                            prefix: IconBroken.Message,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaulttextformfield(
                            controller: phonecon,
                            radius: 30,
                            keyboardtype: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone number must not be empty';
                              }
                            },
                            label: 'Phone',
                            prefix: IconBroken.Call,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:project/shared/styles/colors.dart';

import '../../layout/supervisor/supervisor_layout.dart';
import '../../layout/supervisor/supervisorcubit/cubit.dart';
import '../../layout/supervisor/supervisorcubit/states.dart';
import '../../shared/components/components.dart';

class supervisorEditProfileScreen extends StatelessWidget {
  var namecon = TextEditingController();
  var phonecon = TextEditingController();
  var emailcon = TextEditingController();
  var passwordcon = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkey1 = GlobalKey<FormState>();
  var emailchaged = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<supervisorLayoutcubit,supervisorLayoutstates>(
      listener: (context, state) {
        if(state is supervisorUploadProfileImageSucessState){
          showtoast(text: 'image uploaded sucessfully ', state: toaststates.SUCCESS);
          supervisorLayoutcubit.get(context).supervisorSelectedImage=null;
        }
        if (state is supervisorUpdatesucessState) {
          showtoast(
              text: 'profile uploaded sucessfully ',
              state: toaststates.SUCCESS);
          supervisorLayoutcubit.get(context).supervisorSelectedImage = null;
          supervisorLayoutcubit.get(context).supervisorProfileImage = null;
          emailchaged = false;
          passwordcon.clear();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print(passwordcon.text);
        print(emailchaged);        var userModel = supervisorLayoutcubit.get(context).supervisormodel;
        var supervisorProfileImage = supervisorLayoutcubit.get(context).supervisorProfileImage;
        namecon.text = userModel!.name! ;
        phonecon.text = userModel!.phone!;
        emailcon.text = userModel!.email!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cc.defcol,
            title: Center(
              child: Text('Edit profile',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            leading: IconButton(
              onPressed: () {
                supervisorLayoutcubit .get(context). supervisorProfileImage =null;
                supervisorLayoutcubit .get(context). supervisorSelectedImage=null;
                emailchaged=false;
                passwordcon.clear();
                Navigator.pop(context);
              },
              icon: Icon(IconBroken.Arrow___Left_2, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  print(passwordcon.text);
                  if (emailchaged == true && passwordcon.text.length > 0) {
                    if (formkey.currentState!.validate()) {
                      supervisorLayoutcubit.get(context).updateSupervisorData(
                        name: namecon.text,
                        phone: phonecon.text,
                        email: emailcon.text,
                        password: passwordcon.text,
                      );
                    }
                  } else if (emailchaged == false && passwordcon.text.length == 0) {
                    if (formkey.currentState!.validate()) {
                      supervisorLayoutcubit.get(context).updateSupervisorData(
                        name: namecon.text,
                        phone: phonecon.text,
                        email: emailcon.text,
                        password: passwordcon.text,
                      );
                    }
                  } else {
                    showtoast(
                        text:
                        'you must enter your password if to change your email',
                        state: toaststates.ERROR);
                  }
                },
                icon: Icon(Icons.check, color: Colors.white),
              )
            ],
          ),
          body: Container(
            color: defaultcol,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: defaultcol,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // SizedBox(height: 70,),
                          ConditionalBuilder(
                            condition: userModel?.image !=null,
                            builder: (context) => Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                CircleAvatar(
                                  radius: 54.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: supervisorProfileImage == null ?
                                    NetworkImage('${userModel?.image}' ,)
                                        : FileImage(supervisorProfileImage) as ImageProvider,
                                  ),
                                ),
                                IconButton(
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20.0,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    supervisorLayoutcubit.get(context).getSupervisorImage();

                                  },
                                ),
                              ],
                            ),
                            fallback: (context) => Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                CircleAvatar(
                                  radius: 54.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: supervisorProfileImage == null
                                        ?   AssetImage('images/profileimage.jpg')
                                        : FileImage(supervisorProfileImage)
                                    as ImageProvider,
                                  ),
                                ),
                                IconButton(
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20.0,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    supervisorLayoutcubit
                                        .get(context)
                                        .getSupervisorImage();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          if (supervisorLayoutcubit.get(context).supervisorSelectedImage != null)
                                            defaultbutton(
                                              onpress: () {
                                                supervisorLayoutcubit.get(context).uploadSupervisorProfileImage();
                                              },
                                              text: 'upload profile image',
                                              radius: 30,
                                            ),

                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          if (state is supervisorUpdateLoadingState)
                                            LinearProgressIndicator(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 20.0,
                                ),
                                defaulttextformfield(
                                  controller: namecon,
                                  radius: 30,
                                  keyboardtype: TextInputType.name,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'name must not be empty';
                                    }
                                  },
                                  label: 'Name',
                                  prefix: IconBroken.User,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaulttextformfield(
                                  controller: emailcon,
                                  radius: 30,
                                  onshange: (p0) {
                                    emailchaged = true;
                                  },
                                  keyboardtype: TextInputType.text,
                                  ontap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                        ),
                                        title: Text(
                                          'You have to enter your password to change your email',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        content: Form(
                                          key: formkey1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              defaulttextformfield(
                                                controller: emailcon,
                                                radius: 30,
                                                onshange: (p0) {
                                                  emailchaged = true;
                                                },
                                                keyboardtype:
                                                TextInputType.text,
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Email must not be empty';
                                                  }
                                                },
                                                label: 'Email',
                                                prefix: IconBroken.Message,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              defaulttextformfield(
                                                controller: passwordcon,
                                                radius: 30,
                                                keyboardtype: TextInputType
                                                    .visiblePassword,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'please enter your  password';
                                                  }
                                                },
                                                label: 'Password',
                                                prefix: IconBroken.Password,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              if (formkey1.currentState!.validate()) {
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text(
                                              'Done',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Email must not be empty';
                                    }
                                  },
                                  label: 'Email',
                                  prefix: IconBroken.Message,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaulttextformfield(
                                  controller: phonecon,
                                  radius: 30,
                                  keyboardtype: TextInputType.phone,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'phone number must not be empty';
                                    }
                                  },
                                  label: 'Phone',
                                  prefix: IconBroken.Call,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );


  }
}
