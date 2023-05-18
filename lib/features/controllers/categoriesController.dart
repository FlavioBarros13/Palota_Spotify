
import 'package:flutter/foundation.dart';
import 'package:flutter_spotify_africa_assessment/features/Models/categoryModel.dart';
import 'package:flutter_spotify_africa_assessment/features/Models/categoryPlaylistModel.dart';
import 'package:flutter_spotify_africa_assessment/features/Models/playlistModel.dart';
import 'package:get/get.dart';


import '../api/client/ApiClient.dart';
import '../api/constants/ApiConstants.dart';

class CategoriesController extends GetxController{


  static CategoriesController instance=Get.find();

  Rx<CategoryModel> categoryModel=CategoryModel().obs;
  Rx<PlaylistModel> playlistModel=PlaylistModel().obs;
  Rx<CategoryPlaylistModel> categoryPlayListModel=CategoryPlaylistModel().obs;
  late RxList<dynamic>categoryItems=RxList<dynamic>([]);
  late RxList<dynamic>playlistArtis=RxList<dynamic>([]);


  Map<String, dynamic>  response={};

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 50;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;


  @override
  void onReady() {
    super.onReady();
    callCategories();
    getCategoryPlaylist(_page,_limit,true);
  }


  clearPlaylistArtist(){
    playlistArtis.clear();

    update();
    //getArtists(artistId: id);
  }
  ///Google Places API
  Future<dynamic>makeApiRequest(categoryId)async{


    var response=await ApiClient.getResponse(categoryId);

    if(response=='Failed')
    {
      return null;
    }


    return response;
  }
  callCategories()async{

    var details =   await makeApiRequest('${ApiConstants.apiBaseURL}${ApiConstants.categoryUrl}');//Make request to Api

    categoryModel.value =CategoryModel.fromMap(details);// Assign Json data to model

    getCategoryPlaylist(0,20,true);//Call category playlist method base on type of category

  }
  getCategoryPlaylist(int page,int limit,bool isRefresh)async{



    Map<String, dynamic> details =   await makeApiRequest('${ApiConstants.apiBaseURL}${ApiConstants.categoryPlaylistUrl}?offset=$page&limit=$limit');// Make api request to get playlists on category

    Map<String, dynamic>messageList = {};//Create a empty list to assign data

    details.forEach((key, value) { //Illiterate through list

      messageList=value;

    });


    categoryPlayListModel.value=CategoryPlaylistModel.fromMap(messageList);
    categoryItems.value=categoryPlayListModel.value.items!;




  }
 Future<dynamic> getCategorySelectedPlaylistDetails(playlistId)async{




   Map<String, dynamic> response =   await makeApiRequest('${ApiConstants.apiBaseURL}playlists/$playlistId');

   //playlistModel.value =PlaylistModel.fromMap(response);
    List messageList = [];


   // print(playlistModel.value.collaborative);
   response.forEach((key, value) => messageList.add({key:'$value'}));   //This is where I've tried adding the elements
  //  print(response);

    // details.forEach((key, value) {
    //
    //   messageList=value;
    //
    // });

   ///getCategorySelectedPlaylistTracks(playlistId, response);


    if(response!='Failed')
    {


    }
    else{
      if (kDebugMode) {
        print('Failed');
      }
    }
    return response;




  }


  Future<dynamic> getArtists({required String artistId})async{
   playlistArtis.clear();
   await makeApiRequest('${ApiConstants.apiBaseURL}artists/$artistId').then((value){
     if(value!=null)
       {
         response=value;
         playlistArtis.add({'id':response['id'],'name':response['name'],'image':response['images'][0]['url']});
       }
   });

   update();

    if(response!='Failed')
    {
        print('Success');


    }
    else{
      if (kDebugMode) {
        print('Failed');
      }
    }
    return response;




  }

}