import 'package:flutterkaigi/graphql/query.dart';
import 'package:flutterkaigi/model/repository.dart';
import 'package:flutterkaigi/plugin/graphql_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<List<Repository>?> fetchRepositories() async {
  var response = await client.query(
    QueryOptions(
      document: gql(repositoriesQuery),
    ),
  );
  final List<dynamic>? results =
  response.data?['viewer']?['repositories']?['nodes'];
  final List<Repository> repositoryList =
  results!.map((dynamic item) => Repository.fromJson(item)).toList();
  return repositoryList;
}


