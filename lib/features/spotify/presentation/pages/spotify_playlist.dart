import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_scroll_animation/easy_scroll_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spotify_africa_assessment/features/spotify/presentation/pages/spotifify_search.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../../colors.dart';
import '../../../QuickHelp/Constants.dart';




class SpotifyPlaylist extends StatefulWidget {
  const SpotifyPlaylist({Key? key, required this.name, required this.image, required this.description, required this.followers, required this.playlistId}) : super(key: key);
  final String name;
  final String image;
  final String playlistId;
  final int followers;
  final String description;

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {


   late var selectedPlaylist;
   var tracks;
   List<Map<String, dynamic>> messageList2 = [];
   List messageList = [];
   List<dynamic>songs=[];
   int followers=0;
   String description='';
   NumberFormat numberFormat = NumberFormat.decimalPattern('hi');


  String formatTime(Duration duration) => (duration.inMilliseconds / 100000)
      .toStringAsFixed(2)
      .replaceFirst('.', ':')
      .padLeft(5, '0');

  @override
  void dispose() {
    super.dispose();
    Constants.categoriesController.clearPlaylistArtist();//Clear artistList to clean as dispose
  }

  @override
  void initState() {

    super.initState();
    getData(); //initialize data requesting from API

  }


  getData()async{
    selectedPlaylist = await Constants.categoriesController.getCategorySelectedPlaylistDetails(widget.playlistId);

    setState(() {
      followers=selectedPlaylist["followers"]['total'];
      description=selectedPlaylist["description"];
      tracks=selectedPlaylist["tracks"]['items'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isAndroid?
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarIconBrightness: Brightness.light,

      ) :SystemUiOverlayStyle.light,
      child: Scaffold(
        body: EasyAnimatedScroll(
          topCurve: Curves.linear,
          bottomCurve: Curves.bounceOut,
          bottomAnimationDuration: const Duration(milliseconds: 500),
          topAnimationDuration: const Duration(seconds: 1),
          animationBottomType: AnimationType.size,
          animateBottomWidget: true,
          bottomWidget:
          ///Featured Artists
          Obx(()=>Constants.categoriesController.playlistArtis.isNotEmpty? ShowUpAnimation(
            direction: Direction.horizontal,
            animationDuration: const Duration(milliseconds: 400),
            delayStart: const Duration(milliseconds: 0),
            offset: -0.2,
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10.0,top: 10),
              child: SizedBox(
                height: 173,
                child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: Constants.categoriesController.playlistArtis.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {


                        String id=Constants.categoriesController.playlistArtis[index]['id'];
                        String images=Constants.categoriesController.playlistArtis[index]['image'];
                        String artist=Constants.categoriesController.playlistArtis[index]['name'];




                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 1,

                            child:  ScaleAnimation(
                                child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Material(
                                            elevation: 5,
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(7),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(7),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width:100,
                                                imageUrl:images,
                                                placeholder: (context, url) =>  Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                                errorWidget: (context, url, error)=> Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(artist,style: const TextStyle(fontSize: 12),),
                                          ),
                                        ],
                                      ),
                                    )

                                )
                            )

                        );
                      },
                    )

                ),
              ),
            ),

          ):

          /// Loading message
          const LoadingMessageWidget(title: 'Artists',),
          ),
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            floatingActionButton: FloatingActionButton.small(backgroundColor: Colors.transparent,elevation: 0,onPressed: ()=>Get.back(),child: const Icon(Icons.arrow_back_rounded,color: Colors.white,),),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: ()=>Get.to(()=> SpotifySearch(songs:songs,) ,transition:Transition.rightToLeftWithFade,curve: Curves.easeInOut,duration: const Duration(milliseconds: 300),),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                            child: CircleAvatar(backgroundColor: Colors.white12,child: Icon(Icons.search,color: Colors.white,)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 58.0),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Container(
                              height: 300,
                              width: 265,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Hero(

                                    tag: widget.image,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal:6),
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(13),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              height: 250,
                                              width:double.infinity,
                                              imageUrl:widget.image,
                                              placeholder: (context, url) =>  Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                              errorWidget: (context, url, error)=> Center(child: SizedBox(width:70,height:70,child: Image.asset(Constants.logo, fit: BoxFit.contain))),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                                      child: Text(widget.name,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(description, textAlign: TextAlign.left,),
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100)),
                              color: Colors.white12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text('${numberFormat.format(followers)} followers',style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                            ),
                          ),
                        ),
                      ),


                      //Gradient divider
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 19.0,horizontal: 17),
                        child: Container(
                          height: 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(100),
                            gradient:AppColors.primaryGradient,
                          ),
                        ),
                      ),


                      ///Track List
                      tracks!=null? ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: const Duration(milliseconds: 400),
                        delayStart: const Duration(milliseconds: 0),
                        offset: -0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10,right: 10.0,top: 30),
                          child: AnimationLimiter(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: tracks.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {

                                  String title=tracks[index]['track']['name'];
                                  String artist=tracks[index]['track']['artists'][0]['name'];
                                  String images=tracks[index]['track']['album']['images'][0]['url'];
                                  String id=tracks[index]['track']['artists'][0]['id'];
                                  String name=tracks[index]['track']['artists'][0]['name'];
                                  String duration= formatTime(Duration(milliseconds:tracks[index]['track']['duration_ms']));

                                  //Add data to song list
                                  songs.add({'title':title,'artist':artist,'images':images,'duration':duration});


                                  WidgetsBinding.instance.addPostFrameCallback((_){

                                    Constants.categoriesController.getArtists(artistId: id);
                                  });




                                  return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration: const Duration(milliseconds: 375),
                                      columnCount: 1,

                                      child:  ScaleAnimation(
                                          child: FadeInAnimation(
                                              child: PlaylistTrackTileWidget(images: images, title: title, artist: artist, duration: duration)

                                          )
                                      )

                                  );
                                },
                              )

                          ),
                        ),

                      ):const LoadingMessageWidget(title: 'Tracks')

                    ],
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 140,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                        color: Colors.white12,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Text('Featured Artists',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
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

class PlaylistTrackTileWidget extends StatelessWidget {
  const PlaylistTrackTileWidget({
    super.key,
    required this.images,
    required this.title,
    required this.artist,
    required this.duration,
  });

  final String images;
  final String title;
  final String artist;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading:Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: 50,
            width:50,
            imageUrl:images,
            placeholder: (context, url) =>  Image.asset(Constants.logo, fit: BoxFit.cover),
            errorWidget: (context, url, error)=> Image.asset(Constants.logo, fit: BoxFit.cover),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(artist),
      trailing: Text(duration),
    );
  }
}

class LoadingMessageWidget extends StatelessWidget {
  const LoadingMessageWidget({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.multitrack_audio_rounded,color: Colors.white,),
          ),
          Text('Loading $title',style: const TextStyle(color: Colors.white),),
        ],
      ),),
    );
  }
}
