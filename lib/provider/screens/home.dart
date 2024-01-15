import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (_)=>Movieprovider(),
  child: MaterialApp(home: homepro(),),));}
class homepro extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var movies=context.watch<Movieprovider>().movies;
    var movielist=context.watch<Movieprovider>().wishmovie;
   return Scaffold(
     appBar: AppBar(title: Text("HOME",style: GoogleFonts.aboreto(color: Colors.black),),),
     body: Padding(
       padding: const EdgeInsets.only(top: 60,),
       child: Column(
         children: [
           Center(child: ElevatedButton.icon(onPressed: (){
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>wishlist()));
           }, icon:Icon(Icons.favorite),
             label: Text("Wishlist ${movielist.length}",
               style: GoogleFonts.aboreto(color: Colors.black),),)),
        SizedBox(height: 30,),
           Expanded(child:ListView.builder(itemBuilder: (context,index)
           {
             var movie=movies[index];
             return Card(
               key: ValueKey(movie.title),
               child: ListTile(
                 title:Text(movie.title),
                 subtitle: Text(movie.time ?? "No time"),
                 trailing:IconButton(icon: Icon(Icons.favorite),
                 color: movielist.contains(movie)? Colors.red : Colors.blue,
                   onPressed: () {
                   if(!movielist.contains(movie))
                     {
                       context.read<Movieprovider>().addtolist(movie);
                     }
                   else
                     {
                       context.read<Movieprovider>().removelist(movie);
                     }
                   },) ,
               ),
             );

           })),
         ],
       ),
     ),
   );
  }

}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:samplefeb/statemanagemntusing_Provider/provider/MovieProvider.dart';
// import 'package:samplefeb/statemanagemntusing_Provider/screens/Wishlist.dart';
//
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (_) => MovieProvider(),
//     child: MaterialApp(home: Home()),
//   ));
// }
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var movies = context.watch<MovieProvider>().movies;
//     var movielist = context.watch<MovieProvider>().wishmovie;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("HOME"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> WishList()));
//                 },
//                 icon: const Icon(Icons.favorite),
//                 label:  Text("Go To WishList ${movielist.length}")),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListView.builder(itemBuilder: (context, index) {
//                       var movie = movies[index];
//                       return Card(
//                         key: ValueKey(movie.title),
//                         child: ListTile(
//                           title: Text(movie.title),
//                           subtitle: Text(movie.time ?? "No time"),
//                           trailing: IconButton(
//                             icon: Icon(Icons.favorite),
//                             color: movielist.contains(movie)
//                                 ? Colors.red
//                                 : Colors.white,
//                             onPressed: () {
//                               if (!movielist.contains(movie)) {
//                                 context.read<MovieProvider>().addToList(movie);
//                               } else {
//                                 context.read<MovieProvider>().removeFromList(movie);
//                               }
//                             },
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }