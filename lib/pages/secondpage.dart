import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List data = [];
  Future<String> getreq() async {
    var api = Uri.https("api.themoviedb.org", "/3/discover/movie",
        {"api_key": "1e058d9d1bbb0bf7e45949d02e6d8f7d"});
    var response = await http.get(api);

    Map<String, dynamic> map = jsonDecode(response.body);

    data = map["results"];

    print(data);

    return response.body.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: FutureBuilder(
      future: getreq(),
      builder: (context, snapshot) {
        //if we are waiting for the response

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Text(
            "Waiting...",
            style: TextStyle(fontSize: 43, fontWeight: FontWeight.w300),
          ));
        } else if (snapshot.hasError) {
          return const Center(
              child: Text(
            "Hold on we fixing it 🔧",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ));
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          "https://image.tmdb.org/t/p/w300${data[index]["backdrop_path"]}"),
                      Container(
                        alignment: Alignment.center,
                        child: Text(data[index]["title"]),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
          );
        }
      },
    ));
  }
}
