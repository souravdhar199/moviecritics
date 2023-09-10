import 'package:flutter/material.dart';
import 'package:moviecritics/pages/secondpage.dart';

class MovieDetail extends StatelessWidget {
  final String title;
  final String image;
  final String overview;

  const MovieDetail(
      {super.key,
      required this.title,
      required this.image,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(image),
              const SizedBox(
                height: 20,
              ),
              Text(title),
              const SizedBox(
                height: 20,
              ),
              Text(overview),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          )),
    );
  }
}
