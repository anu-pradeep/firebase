import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/SAMPLEFIREBASE/HELPER%20Firebase.dart';

import 'LOGIN_FIRE.dart';
void main(){runApp(MaterialApp(home: homefire(),));}
class homefire extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text("Welcome",style: GoogleFonts.aclonica(fontSize: 25,color: Colors.black),),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Firehelper().signOut().then((v)
              {
                Get.to(loginsfire());
              });
            },
                child:Text("Log out",style: GoogleFonts.aclonica(fontSize: 20),)),
          ],
        ),
      ),
    );
  }}