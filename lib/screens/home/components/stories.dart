

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_flutter_app/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../models/model.dart';

class Stories extends StatelessWidget{
  List<Story> stories ;
  Stories({required this.stories});
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder:(BuildContext context,int index) => StoryCard(context,index)),
    );
  }
StoryCard(BuildContext context,int index){
  return index==0?
   Container(
     margin: EdgeInsets.only(left: 10),
     width:150,
     height: 200,
     child:  Stack(
       children: [
         ClipRRect(
         borderRadius: BorderRadius.circular(15),
           child: CachedNetworkImage(imageUrl: currentUser.imageUrl,height: 200,width: 150,fit: BoxFit.cover,),
         ),
         Positioned(
             top: 10,
             left: 10,
             child:
             CircleAvatar(

               backgroundImage: CachedNetworkImageProvider(stories[index].user.imageUrl),
             ),
         ),
         Positioned(
           bottom: 10,
           left: 10,
           child:
           Text(stories[index].user.name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
         )
       ],
     ),
   )
  :
  Container(
    margin: EdgeInsets.only(left: 10),
    width:150,
    height: 200,
    child:  Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(imageUrl: stories[index].imageUrl,height: 200,width: 150,fit: BoxFit.cover,),
        ),
        Positioned(
          top: 10,
          left: 10,
          child:
          CircleAvatar(

            backgroundImage: CachedNetworkImageProvider(stories[index].user.imageUrl),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child:
            Text(stories[index].user.name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
        )
      ],
    ),
  )
  ;
}

}