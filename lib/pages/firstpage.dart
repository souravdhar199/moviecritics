import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //Calling to fetch data
  Future<String> getreq() async {
    var api = Uri.https("api.themoviedb.org", "/3/discover/movie",
        {"api_key": "1e058d9d1bbb0bf7e45949d02e6d8f7d"});
    var response = await http.get(api);

    return response.body.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          children: [
            Container(
              height: 400,
              child: FutureBuilder(
                future: getreq(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(34),
                          child: Text(
                            "Waiting...",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text(snapshot.data.toString());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text("Next page"))
          ],
        ),
      ),
    );
  }
}
