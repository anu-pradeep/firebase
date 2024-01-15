import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class wishlist extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var wishlist=context.watch<Movieprovider>().wishmovie;
   return Scaffold(
     appBar: AppBar(title: Text(" My Wishlist(${wishlist.length})",style: GoogleFonts.aboreto(color: Colors.black),),),
     body: ListView.builder(
     itemCount: wishlist.length,
     itemBuilder: (context,index){
       final movie=wishlist[index];
       return Card(
         key: ValueKey(movie.title),
         child: ListTile(
           title:Text(movie.title) ,
           trailing: TextButton(onPressed: () {
             context.read<Movieprovider>().removelist(movie);
           }, child: Text("REMOVE"),),
         ),
       );
     }),

   );
  }

}
// class WishList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var wishlist = context.watch<MovieProvider>().wishmovie;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My WishList (${wishlist.length})"),
//       ),
//       body: ListView.builder(
//           itemCount: wishlist.length,
//           itemBuilder: (context, index) {
//             final movie = wishlist[index];
//             return Card(
//               key: ValueKey(movie.title),
//               child: ListTile(
//                 title: Text(movie.title),
//                 trailing: TextButton(
//                   onPressed: () {
//                     context.read<MovieProvider>().removeFromList(movie);
//                   },
//                   child: Text("REMOVE"),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }