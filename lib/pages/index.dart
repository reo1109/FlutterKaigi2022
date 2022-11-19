import 'package:flutter/material.dart';
import 'package:flutterkaigi/model/repository.dart';
import 'package:flutterkaigi/repositories/github_repository.dart';

class IssueListPage extends StatelessWidget {
  const IssueListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FutureBuilder<dynamic>(
          future: fetchRepositories(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Text('Loading');
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text('Error : ${snapshot.error}'));
                }

                if (snapshot.data == null) {
                  return const Text('No repositories');
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final Repository repository = snapshot.data[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CardItem(
                        title: repository.name,
                        message: repository.description ?? '',
                        url: repository.url,
                        updatedAt: repository.updatedAt,
                      ),
                    );
                  },
                );
            }
          }
      ),
    );


  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.id,
    required this.title,
    required this.message,
    required this.url,
    required this.updatedAt,
  });
  final String? id;
  final String title;
  final String message;
  final String url;
  final String updatedAt;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: const Color(0xFFEFEFEF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  Text(
                    updatedAt,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}