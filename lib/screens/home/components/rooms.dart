import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../models/model.dart';
import '../../../palette.dart';

class Rooms extends StatelessWidget{
  List<User> onlineUsers ;

  Rooms({required this.onlineUsers});


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1+ onlineUsers.length,
          itemBuilder: (BuildContext context,int index) => CardContainer(context, index)
      ),
    );
  }
  Widget CardContainer(BuildContext context,int index){
    return index==0?
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xffdddddd),width: 1)
          ),
          child: Row(
            children: [
              ShaderMask(
                child: Icon(Icons.camera_enhance_rounded,size: 15,),
                shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
              ),
              SizedBox(width: 4,),
              Text("create \n  room")
            ],
          ),
        ):
    Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(left: 10),
      child:Stack(
        children: [
          CircleAvatar(

           backgroundImage: CachedNetworkImageProvider(onlineUsers[index-1].imageUrl,),

          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index>4 ? Colors.green : Color(0xffeeeeee)
                ),
              ))
        ],
      )
    )

        ;
  }
}