/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, post;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen(List<> keywords, {Key? key}) : super(key: key);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> keywords = [];
  final Map<String, dynamic> keywordsMap = {};


  Future<void> postKeywords(parsedJson) async {
    await post(Uri.http("10.0.2.2:8000", "/search"), body: parsedJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          print('---------------' * 20);
          for (int i = 0 ; i < keywords.length ; i++) {
            keywordsMap["$i"] = keywords[i];
          }
          var parsedJson = json.encode(keywordsMap);
          postKeywords(parsedJson);
        },
      ),

      /// Skipped many lines

    );
  }
}*/
