import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../models/model.dart';


class CreatePostContainer extends StatelessWidget{
  User currentUser ;

  CreatePostContainer({required this.currentUser});


  @override
  Widget build(BuildContext context) {

    return  Column(children: [
      SizedBox(height: 5,),
      Row(
        children: [
          SizedBox(width: 10,),
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
            ),
          SizedBox(width: 10,),
          Expanded(child:
          TextField(
            decoration: InputDecoration(
                hintText: "what's on your mind?",
                border: InputBorder.none
            ),
          )
          ),
          SizedBox(width: 10,)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.video_call,color: Colors.red,), label: Text("Live")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.photo_library,color: Colors.green,), label: Text("Photo")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.videocam,color: Colors.purpleAccent,), label: Text("Room")),


        ],
      ),
      SizedBox(height: 5,),

    ],);
  }

}