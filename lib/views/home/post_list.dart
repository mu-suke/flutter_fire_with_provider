import 'package:flutter/material.dart';
import 'package:flutter_firebase_provider/constaints/loading.dart';
import 'package:flutter_firebase_provider/models/post.dart';
import 'package:flutter_firebase_provider/views/home/post_tile.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {

    final posts = Provider.of<List<Post>>(context) ?? [];

    if(posts == null) {
      return Loading();
    } else {
      return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostTile(post: posts[index]);
        },
      );
    }
  }
}
