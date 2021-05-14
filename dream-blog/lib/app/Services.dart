import 'package:http/http.dart' as http;
import 'modules/home/Post.dart';
import 'dart:async';
import 'dart:convert';

Future<Post> fetchPost(int num) async {

  final response = await http.get('https://jsonplaceholder.typicode.com/posts/'+ num.toString());

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha ao carregar o post!');
  }
} // pick up a single post from JSONPlaceholder

List<Future> fetchAllPosts() {

  // ignore: deprecated_member_use
  List<Future<Post>> posts = List<Future<Post>>(100);

  for (int i = 0; i < 100; i++){
    posts[i] = fetchPost(i+1);
  }

  return posts;
}  // pick up all posts from JSONPlaceholder

