import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/Models/categoryModel.dart';
import 'package:flutter_spotify_africa_assessment/features/QuickHelp/Constants.dart';
import 'package:flutter_spotify_africa_assessment/features/api/client/ApiClient.dart';
import 'package:flutter_spotify_africa_assessment/features/barrels/pages.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:show_up_animation/show_up_animation.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../barrels/widgets.dart';

// TODO: fetch and populate playlist info and allow for click-through to detail
// Feel free to change this to a stateful widget if necessary
class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {


  int currentPage = 1;

  late int totalPages;

  List<dynamic> passengers = [];

  final RefreshController refreshController = RefreshController(initialRefresh: true);

  void initState() {
    // TODO: implement initState
    super.initState();



  }


  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    Constants.categoriesController.getCategoryPlaylist(currentPage, totalPages,isRefresh);


    currentPage++;

    totalPages = Constants.categoriesController.categoryItems.length;

    setState(() {});

      return true;


  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isAndroid?
         SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).colorScheme.background,
    systemNavigationBarColor: Theme.of(context).colorScheme.background,
    systemNavigationBarIconBrightness: Brightness.light,

    ) :SystemUiOverlayStyle.light,
      child:

      Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,

        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool i) {
            return <Widget>[

              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.background,

                automaticallyImplyLeading: false,
                elevation: 0,
                stretch: false,
                pinned: false,
                floating: true,
                expandedHeight: 0,
                centerTitle: true,
                title:  Text(widget.categoryId.replaceFirst('a', 'A')),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
                  ),
                ],
                flexibleSpace: Container(
                  decoration:  BoxDecoration(
                      gradient: AppColors.primaryGradient
                  ),
                ),

              )
            ];
          },

          body: SafeArea(
            child: Column(
              children: [


                const Padding(
                  padding: EdgeInsets.only(left: 18.0,top:10),
                  child: AfroPlaylistBar(),
                ),


                Expanded(
                  child: ShowUpAnimation(
                    direction: Direction.vertical,
                    animationDuration: const Duration(milliseconds: 400),
                    delayStart: const Duration(milliseconds: 0),
                    offset: 0.2,
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,right: 10.0,top: 30),
                      child: AnimationLimiter(
                          child: MasonryGridView.count(
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            itemCount: Constants.categoriesController.categoryItems.length,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {

                              String name=Constants.categoriesController.categoryItems[index]['name'];
                              String description=Constants.categoriesController.categoryItems[index]['description'];
                              int followers=Constants.categoriesController.categoryItems[index]['tracks']['total'];
                              String playlistId=Constants.categoriesController.categoryItems[index]['id'];
                              //print(playlistId);

                              List<dynamic> images=Constants.categoriesController.categoryItems[index]['images'];
                              late String image;
                              for(var imageUrl in images){
                                image=imageUrl['url'];
                              }


                              return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: 2,

                                  child:  ScaleAnimation(
                                      child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: ()=>Get.to(()=>  SpotifyPlaylist(name: name, image: image, description: description, followers: followers, playlistId:playlistId ,),transition:Transition.rightToLeftWithFade,curve: Curves.easeInOut,duration: const Duration(milliseconds: 300),),
                                            splashColor: Colors.transparent,
                                            overlayColor:const MaterialStatePropertyAll( Colors.transparent),

                                            child: Hero(
                                              tag: image,
                                              child: Material(
                                                elevation: 4,
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                  height: 230,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white12,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal:6),
                                                        child: Material(
                                                          elevation: 5,
                                                          color: Colors.transparent,
                                                          borderRadius: BorderRadius.circular(13),
                                                          child: Align(
                                                            alignment: Alignment.topCenter,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(13),
                                                              child: CachedNetworkImage(
                                                                fit: BoxFit.fill,
                                                                height: 180,
                                                                width:double.infinity,
                                                                imageUrl:image,
                                                                placeholder: (context, url) =>  Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                                                errorWidget: (context, url, error)=> Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                                                          child: Text(name,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )

                                        // CategoryButtons(
                                        //   title: snapshot.data.docs[index][Constants.nameTxt],
                                        //   image: snapshot.data.docs[index][Constants.imageTxt],
                                        //   id: snapshot.data.docs[index][Constants.idTxt],
                                        //   isProduct: snapshot.data.docs[index][Constants.isProductTxt],
                                        // )
                                      )
                                  )

                              );
                            },
                          )

                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AfroPlaylistBar extends StatelessWidget {
  const AfroPlaylistBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(Constants.categoriesController.categoryModel.value.icons?[0]['url']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(text: const TextSpan(text: 'Afro ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),children: [
              TextSpan(text: 'playList',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 27))
            ])),
          ),

          // Text(
          //   '''Populate with playlist info for category '${widget.categoryId}', click on playlist to view playlist detail''',
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
