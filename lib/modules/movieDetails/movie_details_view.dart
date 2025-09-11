// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:route_movies_app/core/constants/app_assets.dart';
// import 'package:route_movies_app/core/extensions/extensions.dart';
// import 'package:route_movies_app/core/theme/color_palette.dart';
// import 'package:route_movies_app/core/widgets/custom_elevated_button.dart';
// import 'package:route_movies_app/main.dart';
//
// import 'Widgets/castContainerWidget.dart';
// import 'Widgets/containerWidget.dart';
// import '../../core/widgets/filmContainerWidget.dart';
//
// class MovieDetailsView extends StatefulWidget {
//
//   const MovieDetailsView({super.key});
//
//   @override
//   State<MovieDetailsView> createState() => _MovieDetailsViewState();
// }
//
// class _MovieDetailsViewState extends State<MovieDetailsView> {
//
//
//
//   bool isMarked = false;
//   @override
//   Widget build(BuildContext context) {
//     var _viewModel = Provider.of<MovieViewModel>(context);
//
//     var mediaQuery = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: SizedBox(
//         height: mediaQuery.height,
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: mediaQuery.height,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(AppAssets.movie_details_bg),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               //child: ,
//             ),
//             ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: (){
//                           navigatorKey.currentState!.pop();
//                         }
//                           ,child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35)),
//                       GestureDetector(
//                         onTap: () {
//                           isMarked = !isMarked;
//                           setState(() {});
//                         },
//                         child: Icon(
//                           isMarked
//                               ? Icons.bookmark
//                               : Icons.bookmark_border_outlined,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                     ],
//                   ).setHorizontalAndVerticalPadding(context, 0.04, 0.048),
//                   SizedBox(height: 100),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Image.asset(AppAssets.playMovieImage),
//                   ),
//                   SizedBox(height: 195),
//                   Text(
//                     _viewModel.selectedMovie!.title,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     "2022",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   SizedBox(
//                     width: double.infinity,
//                     child: CustomElevatedButton(
//                       borderRadius: 15,
//                       title: "Watch",
//                       bgColor: ColorPalette.red,
//                       titleColor: Colors.white,
//                       titleSize: 22,
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 10,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ContainerWidget(text: "15", imagePath: AppAssets.favIcon),
//                       ContainerWidget(text: "90", imagePath: AppAssets.timeIcon),
//                       ContainerWidget(text: "7.6", imagePath: AppAssets.RatingIcon),
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Screen Shots", style: TextStyle(
//                       fontSize: 28,
//                       color: ColorPalette.white,
//                       fontWeight: FontWeight.bold
//                     ),
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 18,),
//                   Image.asset(AppAssets.screenShotMovieDetails1),
//                   SizedBox(height: 18,),
//                   Image.asset(AppAssets.screenShotMovieDetails2),
//                   SizedBox(height: 18,),
//                   Image.asset(AppAssets.screenShotMovieDetails3),
//                   SizedBox(height: 18,),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Similar", style: TextStyle(
//                         fontSize: 28,
//                         color: ColorPalette.white,
//                         fontWeight: FontWeight.bold
//                     ),
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 18,),
//                   Container(
//                     width: 399,
//                     height: 600,
//
//                     child:Column(
//
//                       children: [
//                         Row(
//                           children: [
//                             ContinerfilmWidget(ImagePathDetails: AppAssets.movie4, rating: '7.7',),
//                             SizedBox(width: 15,),
//                             ContinerfilmWidget(ImagePathDetails: AppAssets.movie5, rating: '7.7',),
//
//                           ],
//                         ),
//                         SizedBox(height: 15,),
//                         Row(
//                           children: [
//                             ContinerfilmWidget(ImagePathDetails: AppAssets.movie6, rating: '7.7',),
//                             SizedBox(width: 15,),
//                             ContinerfilmWidget(ImagePathDetails: AppAssets.movie3, rating: '7.7',),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ).setHorizontalPadding(context, 0.04),
//                   SizedBox(height: 18,),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Summery", style: TextStyle(
//                         fontSize: 28,
//                         color: ColorPalette.white,
//                         fontWeight: FontWeight.bold
//                     ),
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 18,),
//                   Text("Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346", style: TextStyle(
//                       fontSize: 16,
//                       color: ColorPalette.white,
//                     fontWeight: FontWeight.w500
//                   ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 18,),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Cast", style: TextStyle(
//                         fontSize: 28,
//                         color: ColorPalette.white,
//                         fontWeight: FontWeight.bold
//                     ),
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 18,),
//                   CastContainer(name: ' Hayley Atwell', character: 'Captain Carter', imagepath: AppAssets.actor1,),
//                   SizedBox(height: 12,),
//                   CastContainer(name: ' Elizabeth Olsen', character: 'Wanda Maximoff /\n The Scarlet Witch', imagepath: AppAssets.actor2,),
//                   SizedBox(height: 12,),
//                   CastContainer(name: ' Rachel McAdams', character: 'C Dr. Christine Palmer', imagepath: AppAssets.actor3,),
//                   SizedBox(height: 12,),
//                   CastContainer(name: ' Charlize Theron', character: 'Clea', imagepath: AppAssets.actor4,),
//                   SizedBox(height: 18,),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Genres", style: TextStyle(
//                         fontSize: 28,
//                         color: ColorPalette.white,
//                         fontWeight: FontWeight.bold
//                     ),
//                     ),
//                   ).setHorizontalPadding(context, 0.035),
//                   SizedBox(height: 12,),
//                   Wrap(
//                     spacing: 12,
//                     runSpacing: 12,
//                     children: [
//                       ContainerWidget(text: 'Action', fontSize: 16),
//                       ContainerWidget(text: 'Sci-Fi', fontSize: 16),
//                       ContainerWidget(text: 'Adventure', fontSize: 16),
//                       ContainerWidget(text: 'Fantasy', fontSize: 16), // ✅ Will wrap to next line if needed
//                       ContainerWidget(text: 'Horror', fontSize: 16),   // ✅ Moves to new row if necessary
//                     ],
//                   ).setHorizontalPadding(context, 0.02),
//
//
//
//
//
//                 ],
//               )],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
