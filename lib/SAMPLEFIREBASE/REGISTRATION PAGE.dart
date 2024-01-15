import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/SAMPLEFIREBASE/HELPER%20Firebase.dart';

import 'LOGIN_FIRE.dart';
class registrpage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>pageregstate();
}
class pageregstate extends State<registrpage>
{var formkey = GlobalKey<FormState>();
  String ? username;
  String ? email;
  String ? password;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: SingleChildScrollView(
         child: Form(
           key:formkey ,
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 200,left: 20,right: 20),
                 child: TextFormField(
                   decoration: InputDecoration(
                     labelText: "user name",labelStyle: GoogleFonts.aboreto(color: Colors.red),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(100),
                     ),),
                   onSaved: (usname)
                   {
                     username=usname;
                     },
                   validator: (usname) {
                     if (usname!.isEmpty)
                       {
                         return "Enter valid username";
                       }
                     else
                     {
                       return null;
                     }
                     }
                 ),
               ),
               SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: TextFormField(
                   decoration: InputDecoration(
                     labelText: "email",labelStyle: GoogleFonts.aboreto(color: Colors.red),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(100),)),
                   onSaved: (mail)
                   {
                     email=mail;
                     },
                   validator: (Email)
                   {if(Email!.isEmpty)
                     {
                       return "Enter valid email id";
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
                   onSaved: (passord)
                   {
                     password=passord;
                   },
                   validator: (pword)
                   {
                     if(pword!.isEmpty)
                       {
                         return " Incorrect password";
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
                     Firehelper().signUP(mail:email!,pwd:password!).then((value)
                     {
                       if(value== null)
                       {
                         Get.to(loginsfire());
                       }
                       else
                         {
                           Get.snackbar("Error", value);
                         }
                     });
                   }
               },
                   child:Text("REGISTER",style: GoogleFonts.aboreto(color: Colors.white),),
               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
             ],
           ),
         )
       ),
     ),
   );
  }

}