import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({this.map, Key key}) : super(key: key);
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${map['image']}'),
              SizedBox(
                height: 20,
              ),
              Text(
                '${map['heading']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
