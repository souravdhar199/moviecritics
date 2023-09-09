import 'dart:convert';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 199, 21, 8),
          title: const Text(
            "📺",
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lets Explore Movies 👋",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 27,
              ),
            )
          ],
        ));
  }
}
