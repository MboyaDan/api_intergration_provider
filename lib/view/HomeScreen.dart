import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_api/controller/news_data.dart';
import 'package:provider_api/view/NewsCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Newsdata>().fetchData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<Newsdata>().initialValues();
                context.read<Newsdata>().fetchData;
              },
              icon: Icon(Icons.refresh))
        ],
        title: Text("Rest Provider"),
      ),
      body: RefreshIndicator(onRefresh: () async {
        await context.read<Newsdata>().fetchData;
      }, child: Center(
        //consumer widget will be listening for data
        child: Consumer<Newsdata>(
          builder: (context, value, child) {
            //if the link is zero,value is false then?
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'Something went wrong.${value.errorMessage}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        itemCount: value.map['stories'].length,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            map: value.map['stories'][index],
                          );
                        },
                      );
          },
        ),
      )),
    );
  }
}
