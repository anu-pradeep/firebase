import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/SAMPLEFIREBASE/HELPER%20Firebase.dart';

import 'HOME PAGE.dart';
import 'REGISTRATION PAGE.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: loginsfire(),
  ));
}
class loginsfire extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => fireloginstate();}
class fireloginstate extends State<loginsfire>
{
  var formkey=GlobalKey<FormState>();
  String ? imail;
  String ? ipass;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       // decoration: BoxDecoration(
       //   image:DecorationImage(image: NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-food-western-food-simple-poster-background-image_25130.jpg"),),
       // ),
       child: SingleChildScrollView(
         child:Form(
           key: formkey,
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 250,right: 20,left: 20),
                 child: TextFormField(
                   textInputAction: TextInputAction.next,
                   decoration: InputDecoration(
                     labelText: "user name",labelStyle: GoogleFonts.aboreto(color: Colors.red),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(100),)),
                   onSaved: (umail)
                   {imail=umail;},
                   validator: (umail)
                   {
                     if(umail!.isEmpty)
                       {
                         return"Incorrect";
                       }
                     else
                       {
                         return null;
                       }
                   },
                 ),
               ),
               SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: TextFormField(
                   obscureText: true,
                   decoration: InputDecoration(
                     labelText: "password",labelStyle: GoogleFonts.aboreto(color: Colors.red),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(100),)),
                   onSaved: (ppass)
                   {
                     ipass=ppass;
                   },
                   validator: (ppass)
                   {
                     if(ppass!.isEmpty)
                       {
                         return "Incorrect password";
                       }
                     else
                       {
                         return null;
                       }
                   },
                 ),
               ),
               SizedBox(height: 30,),
               ElevatedButton(onPressed: (){
                 if(formkey.currentState!.validate())
                   {
                     formkey.currentState!.save();
                     Firehelper().Signinn(mail:imail!,pass:ipass!).then((value)
                     {
                       if(value==null){Get.to(homefire());}
                       else {
                         Get.snackbar("Error", "User not found");
                       }
                     });
                   }
               }, child:Text("Login",style: GoogleFonts.aboreto(color: Colors.white),
               ),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
             SizedBox(height: 30,),
               TextButton(onPressed: (){
                 Get.to( registrpage());
               }, child: Text("Register here"))
             ],
           ),
         )
       ),
     ),
   );
  }

}
