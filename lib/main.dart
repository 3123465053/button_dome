import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map mapss = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
                  onPressed: () async {
                    await getData();
                    setState(() {});
                  },
                  child: Text("测试API")),
              Container(
                width: 300,
                height: 400,
                color: Colors.blue.shade100,
                child: ListView.builder(
                    itemCount: mapss.isEmpty ? 0 : mapss["channels"].length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text("${mapss["channels"][index]["name"]}"),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    Dio dio = Dio();
    String url = "https://www.douban.com/j/app/radio/channels";
    var res = await dio.get(url);
    mapss = res.data;
  }
}
