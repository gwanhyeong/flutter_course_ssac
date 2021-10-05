import 'dart:convert' as convert;

import 'package:cardlist/constants.dart' as constants;
import 'package:cardlist/model/comment.dart';
import 'package:cardlist/model/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {
  var url = Uri.parse(constants.postsURL);
  final response = await http.get(url);

  Iterable jsonResponse = convert.jsonDecode(response.body);
  return jsonResponse.map((posts) => Post.fromJson(posts)).toList();
}

Future<List<Comment>> fetchComments(int postId) async {
  var url = Uri.parse(constants.commentsURL + '?postId=$postId');
  final response = await http.get(url);

  Iterable jsonResponse = convert.jsonDecode(response.body);
  return jsonResponse.map((comments) => Comment.fromJson(comments)).toList();
}
