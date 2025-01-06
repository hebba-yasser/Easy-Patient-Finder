import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cache_helper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../modules/loginscreen/loginScreen.dart';
dynamic UID;
dynamic ROLE ;
String? LEVEL ;
var admin;
 // Future<void> logout(context) async {
//   await FirebaseAuth.instance.signOut();
//   cacheHelper.removedata(key: 'uId').then((value1) {
//    if(value1==true){
//      cacheHelper.removedata(key: 'role').then((value2) {
//        if(value2==true)
//          navigate(context, loginScreen());
//      });
//    }
// });
// }
// Future<void> logout(context) async {
//   await FirebaseAuth.instance.signOut();
//
//   // Remove user ID and role data from cache
//   await cacheHelper.removedata(key: 'uId');
//   await cacheHelper.removedata(key: 'role');
//
//   // Clear the cache
//   await DefaultCacheManager().emptyCache();
//
//   // Navigate to login screen
//   navigate(context, loginScreen());
//
// }

void printFullText(String ?text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text!).forEach((match) => print(match.group(0)));
}
