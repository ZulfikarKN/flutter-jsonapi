import 'package:tes_pt_eoa/models/album.dart';
import 'package:tes_pt_eoa/models/photo.dart';
import 'package:tes_pt_eoa/models/post.dart';
import 'package:tes_pt_eoa/models/user.dart';
import 'package:tes_pt_eoa/models/comment.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

List<User> listUser = [];
List<Post> listPost = [];
List<Comment> listComment = [];
List<Album> listAlbum = [];
List<Photo> listPhoto = [];

class APIService {
  static Future getUser() async {
    List<User> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    list = List<User>.from(jsonDecode(response.body).map((x) => User.fromJson(x)));
    for (var user in list) {
      listUser.add(user);
    }
  }

  static Future getPost() async {
    List<Post> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    list = List<Post>.from(jsonDecode(response.body).map((x) => Post.fromJson(x)));
    for (var post in list) {
      listPost.add(post);
    }
  }

  static Future getComment() async {
    List<Comment> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    list = List<Comment>.from(jsonDecode(response.body).map((x) => Comment.fromJson(x)));
    for (var comment in list) {
      listComment.add(comment);
    }
  }

  static Future getAlbum() async {
    List<Album> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    list = List<Album>.from(jsonDecode(response.body).map((x) => Album.fromJson(x)));
    for (var album in list) {
      listAlbum.add(album);
    }
  }

  static Future getPhoto() async {
    List<Photo> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    list = List<Photo>.from(jsonDecode(response.body).map((x) => Photo.fromJson(x)));
    for (var photo in list) {
      listPhoto.add(photo);
    }
  }
}