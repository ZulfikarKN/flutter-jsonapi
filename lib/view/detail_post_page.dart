import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tes_pt_eoa/bloc/api.dart';
import 'package:tes_pt_eoa/view/detail_user_page.dart';
import 'package:tes_pt_eoa/models/user.dart';
import 'package:tes_pt_eoa/models/post.dart';
import 'package:tes_pt_eoa/models/comment.dart';

class DetailPost extends StatefulWidget {
  User user;
  Post post;
  DetailPost({required this.user, required this.post});

  @override
  _DetailPostState createState() => _DetailPostState(user: user, post: post);
}

class _DetailPostState extends State<DetailPost> {
  List<Comment> commentList = [];
  User user;
  Post post;
  _DetailPostState({required this.user, required this.post});

  @override
  void initState() {
    super.initState();
    for (var comm in listComment) {
      if (comm.postId == post.id){
        setState(() {
          commentList.add(comm);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Post Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                width: 450,
                color: Colors.grey[300],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: user.name,      
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=> DetailUserPage(user: user))
                          );
                        }
                      ),
                    ),
                    Text(
                      user.company.name + ' company',
                    ),
                    Divider(color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      post.title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      post.body,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 450,
                height: 50,
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Comments: ' + commentList.length.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  commentList.length, 
                  (index) => (commentList[index].postId != post.id)
                    ? Container()
                    : Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        color: Colors.grey[200],
                        width: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentList[index].name, 
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(commentList[index].body),
                            Divider(color: Colors.black,)
                          ],
                        ),
                      ),
                    )
                )
              )
            ],
          ),
        ),
      )
    );
  }
}