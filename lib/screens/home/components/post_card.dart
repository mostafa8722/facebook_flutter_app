import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/model.dart';

class PostCard extends StatelessWidget{

  Post post;
  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _header(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Text(post.caption,style: TextStyle(color: Color(0xff999999)),))
          ],
            
          ),
          ),
          post.imageUrl=="" ?
              SizedBox.shrink():
          CachedNetworkImage(imageUrl: post.imageUrl),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 Container(
                   height: 40,
                   margin: EdgeInsets.only(left: 10,right: 3),
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.blue
                   ),
                   child:  Icon(Icons.thumb_up,color: Colors.white,size: 14,),
                 ),Text(post.likes.toString(),)
                ],
              ),
              Row(
                children: [

                  Text(post.comments.toString(),),
                  SizedBox(width: 3,),
                  Text("comments",),
                  SizedBox(width: 10,),
                  Text(post.shares.toString(),),
                  SizedBox(width: 3,),
                  Text("shares",),
                  SizedBox(width: 5,),
                ],
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(Icons.thumb_up,"Like"),
              _buildIcon(Icons.comment_sharp,"Comments"),
              _buildIcon(Icons.share,"Share"),
            ],
          ),
          Divider(color: Color(0xffdddddd),)
        ],
      ),
    );
  }
  Widget _header(){
    return Row(
      children: [
        SizedBox(width: 4,),
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(post.user.imageUrl),
        ),
        SizedBox(width: 4,),
        Expanded(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.user.name),
            SizedBox(height: 4,),
            Row(
              children: [
                Text("${post.timeAgo} * "),
                Icon(Icons.public)
              ],
            )
          ],
        ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
        SizedBox(width: 4,),
      ],
    );
  }
  Widget _buildIcon(IconData icon,String title){
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5,),
        Text(title)
      ],
    );
  }
}