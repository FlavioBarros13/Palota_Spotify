

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../QuickHelp/Constants.dart';

class SpotifySearch extends StatefulWidget {


  const SpotifySearch({Key? key, required this.songs}) : super(key: key);

  final List songs;
  @override
  State<SpotifySearch> createState() => _SpotifySearchState();
}

class _SpotifySearchState extends State<SpotifySearch> {


  final TextEditingController _searchController =TextEditingController();


  List <dynamic>_foundItems=[];
  List <dynamic>newList=[];

  @override
  void initState() {

    super.initState();
    if(mounted) {
      setState(() {

        _foundItems=widget.songs.toSet().toList();

      });
    }
  }

  void _runFilter(String word){
    List<dynamic>results=[];
    if(word.isEmpty)
    {

        results=widget.songs.toSet().toList();



    }else
    {
      results=widget.songs.toSet().toList().where((music) => music['title'].toLowerCase().contains(word.toLowerCase())).toList();
    }
    setState(() {
      _foundItems=results;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isAndroid?
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarIconBrightness: Brightness.light,

      ) :SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,

    body: SafeArea(
    child: Column(
    children: [
    const SizedBox(height: 20,),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15.0),
    child: Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(100),
    elevation: 0,
    child: Container(
      alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(top: 0,left: 0,right: 0),
    height: 55,
    decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(100),
    ),
    child:TextField(
    onChanged: (v)=>_runFilter(v),
    controller: _searchController,
    cursorColor:  Theme.of(context).colorScheme.background,
    style: TextStyle(color:  Theme.of(context).colorScheme.background,),
    decoration: InputDecoration(
    hintText:'Search song',
    hintStyle: const TextStyle(color: Colors.grey,fontStyle: FontStyle.normal,fontSize: 15),
    isDense: true,
    contentPadding: const EdgeInsets.only(left: 20,top: 5),
    suffixIcon: const Icon(Icons.search,color:Colors.black,),
    prefixIcon: IconButton(icon: const Icon(Icons.arrow_back,color:Colors.black,), onPressed: () { Get.back(); },),
    border: OutlineInputBorder(borderSide: const BorderSide(width:1,color: Colors.transparent), borderRadius: BorderRadius.circular(100.0),),
    focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width:1,color: Colors.transparent), borderRadius: BorderRadius.circular(100.0),),
    enabledBorder: OutlineInputBorder(borderSide:const BorderSide(width:1,color: Colors.transparent), borderRadius: BorderRadius.circular(100.0),),


    ),
    ),

    ),
    ),
    ),

    const SizedBox(height: 5,),
    Expanded(
    child:_foundItems.isNotEmpty?

    ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount:_foundItems.length,
    itemBuilder: (context, index) {

      String title=_foundItems[index]['title'];
      String artist=_foundItems[index]['artist'];
      String images=_foundItems[index]['images'];


      String duration= _foundItems[index]['duration'];




    return  AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 375),
          columnCount: 1,

          child:  ScaleAnimation(
              child: FadeInAnimation(
                  child: ListTile(
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
                  )

              )
          )

      );
    }
    ):const Center(),
    )

    ]
    )
    )
      )

    );
  }
}
