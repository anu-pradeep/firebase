import 'package:firebase_auth/firebase_auth.dart';

class Firehelper
{
  final FirebaseAuth auth =FirebaseAuth.instance;
  get user=>auth.currentUser;

 Future<String ?> signUP({required String mail, required String pwd}) async {
   try {
     await auth.createUserWithEmailAndPassword(email: mail, password: pwd);
     return null;
   }
   on FirebaseAuthException catch (e)
   {
     return e.message;
   }
 }

  Future<String?> Signinn({required String mail, required String pass}) async {
   try{
     await auth.signInWithEmailAndPassword(email: mail, password: pass);
   return null;
   }on FirebaseAuthException catch(e)
    {
      return e.message;
    }
  }
  Future<void> signOut() async {
    await auth.signOut();
  }
}