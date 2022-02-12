import 'package:tes_pt_eoa/bloc/api.dart';
import 'package:tes_pt_eoa/models/album.dart';
import 'package:tes_pt_eoa/models/photo.dart';
import 'package:tes_pt_eoa/models/user.dart';
import 'package:flutter/material.dart';

class DetailUserPage extends StatefulWidget {
  User user;

  DetailUserPage({
    required this.user
  });

  @override
  _DetailUserPageState createState() => _DetailUserPageState(user: user);
}

class _DetailUserPageState extends State<DetailUserPage> {
  _DetailUserPageState({
    required this.user
  });

  User user;
  List<Album> albumList = [];
  late Future<dynamic> _task;

  @override
  void initState() {
    super.initState();
    _task = listedAlbum(); 
  }

  Future listedAlbum() async {
    List<Album> albums = [];
    for (var i in listAlbum) {
      if (i.userId == user.id){
        albums.add(i);
      }
    }
    setState(() {
      albumList = albums;
    });
    print(albumList.length);
    print(listAlbum.length);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(user.email),
                    SizedBox(height: 10,),
                    Text(user.address.street + ' ,' + user.address.city),
                    Text(user.company.name + ' | ' + user.email),
                    SizedBox(height: 50),
                  ],
                ),
              ),
              FutureBuilder(
                future: _task,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator.adaptive();
                  }
                  if (snapshot.hasError) {
                    return Text("Something is wrong");
                  } else {
                    return Container(
                      height: 50,
                      child: Column(
                        children: List.generate(
                          albumList.length, 
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(albumList[index].title),
                                SizedBox(height: 10),
                              ],
                            )
                          ),
                        )
                      )
                    );
                  }
                },
              )
            ]
          ),
        )
        ),
    );
  }
}