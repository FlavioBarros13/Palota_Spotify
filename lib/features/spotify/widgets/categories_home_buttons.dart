


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({Key? key, required this.image, required this.title, required this.id, required this.isProduct}) : super(key: key);

  final String image;
  final String title;
  final String id;
  final bool isProduct;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child:  InkWell(
        //onTap: ()=>Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CategoryDisplay(image: image, title: title, id: id, isProduct: isProduct))),
        child: Container(
          alignment: Alignment.bottomLeft,
           height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFF80AB),
                  Color(0xFFFF5991),
                ]),
            image:  DecorationImage(
              fit: BoxFit.cover,
              colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: CachedNetworkImageProvider(image,
              ) ,
            ),
          ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(25),bottomRight:Radius.circular(25)),
                    elevation: 2,
                    child: Container(
                      height: 50,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                         // gradient: Constants().selectedGradient,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(100.0),bottomRight:Radius.circular(100.0) )
                      ),
                      child:  Text(title,style: const TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );


  }
}
