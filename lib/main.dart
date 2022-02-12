import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tes_pt_eoa/counter_observer.dart';
import 'package:tes_pt_eoa/view/list_post_page.dart';

void main(){
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: CounterObserver()
  );
}

class MyApp extends MaterialApp {
  const MyApp({Key? key}) 
  : super(key: key, home: (const ListPostPage()));
}