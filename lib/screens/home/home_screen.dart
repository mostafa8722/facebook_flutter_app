import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_flutter_app/screens/home/components/create_post_container.dart';
import 'package:facebook_flutter_app/screens/home/components/post_card.dart';
import 'package:facebook_flutter_app/screens/home/components/stories.dart';
import 'package:facebook_flutter_app/widgets/circle_icon.dart';
import 'package:facebook_flutter_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import 'components/rooms.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: Responsive.isDesktop(context) ? AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text("FaceBook",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue,letterSpacing: 1.3),),
        centerTitle: false,
        actions: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
              ),SizedBox(width: 10,),
              Text(currentUser.name,style: TextStyle(color: Color(0xff998899)),)
            ],
          ),
          CircleIcon(icon: Icons.search, iconSize: 18,color: Colors.red,),
          CircleIcon(icon: Icons.message, iconSize: 18),
        ],
        elevation: 0,

      ) : null,
      body:
      
     Responsive(mobile: _HomeScreenMobile(),desktop: _HomeScreenDesktop(),)
    );

  }
}

class _HomeScreenMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text("FaceBook",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue,letterSpacing: 1.3),),
          centerTitle: false,
          actions: [
            CircleIcon(icon: Icons.search, iconSize: 18,color: Colors.red,),
            CircleIcon(icon: Icons.message, iconSize: 18),
          ],
          elevation: 0,
          floating: false,
        ),

        SliverToBoxAdapter(child: CreatePostContainer(currentUser: currentUser)),
        SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
        SliverToBoxAdapter(child: Stories(stories: stories)),
        SliverToBoxAdapter(child: SizedBox(height: 10,)),

        SliverList(

          delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return PostCard(post: posts[index]);
              },
              childCount: posts.length
          ),
        )
      ],
    );

  }
}

class _HomeScreenDesktop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [

          Flexible(
              flex: 2,
              child: Container(color: Colors.blue,)),
          Spacer(),
          Container(width: 600,
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(child: Stories(stories: stories)),
              SliverToBoxAdapter(child: CreatePostContainer(currentUser: currentUser)),
              SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),

              SliverToBoxAdapter(child: SizedBox(height: 10,)),

              SliverList(

                delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return PostCard(post: posts[index]);
                    },
                    childCount: posts.length
                ),
              )
            ],
          ),
          ),
          Spacer(),
          Flexible(
              flex: 2,
              child: Container(
              child: ListView.builder(itemCount: onlineUsers.length,itemBuilder: (BuildContext context, int index) =>CardUser(context,index)),
              )),
        ],
      ),
    );
  }
  Widget CardUser(BuildContext context, int index){
    return Container(
      height: 51,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(onlineUsers[index].imageUrl),
          ),
          SizedBox(width: 5,),
          Text(onlineUsers[index].name,style: TextStyle(color: Color(0xff998899)),),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
}