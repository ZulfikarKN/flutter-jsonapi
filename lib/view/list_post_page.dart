import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tes_pt_eoa/bloc/api.dart';
import 'package:tes_pt_eoa/models/user.dart';
import 'package:tes_pt_eoa/models/post.dart';
import 'package:tes_pt_eoa/view/detail_post_page.dart';
import 'detail_user_page.dart';

class ListPostPage extends StatefulWidget {
  const ListPostPage({ Key? key }) : super(key: key);

  @override
  _ListPostPageState createState() => _ListPostPageState();
}

class _ListPostPageState extends State<ListPostPage> {
  List<User> userList = [];
  List<Post> postList = [];
  late Future<dynamic> _task;

  @override
  void initState() {
    super.initState();
    _task = updateData();
  }

  Future updateData() async {
    await APIService.getPost();
    await APIService.getUser();
    await APIService.getComment();
    await APIService.getAlbum();
    await APIService.getPhoto();
    setState(() {
      userList = listUser;
      postList = listPost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Post Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: _task,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              }
              if (snapshot.hasError) {
                return Text("Something is wrong");
              } else {
                return Container(
                  child: Column(
                    children: List.generate(
                      postList.length, 
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[300],
                            width: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    text: userList[(postList[index].userId - 1)].name,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=> 
                                          DetailUserPage(user: userList[(postList[index].userId - 1)])) 
                                        );
                                      }
                                  ),
                                ),
                                Text(
                                  userList[(postList[index].userId - 1)].company.name + ' company',
                                ),
                                Divider(color: Colors.black),
                                SizedBox(height: 10),
                                Text(
                                  postList[index].title,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  postList[index].body,
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: 
                              (context)=> DetailPost(
                                post: postList[index], 
                                user: userList[(postList[index].userId - 1)])
                              )
                            );
                          },
                        ),
                      ),
                    )
                  )
                );
              }
            },
          )
        )
      ),
    );
  }
}

