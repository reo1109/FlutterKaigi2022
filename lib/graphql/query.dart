String repositoriesQuery = """
  query {
    viewer {
      repositories(last: 10) {
        nodes {
          id
          name
          description
          url
          updatedAt
        }
      }
    }
  }
""";

String issuesQuery = """
  query {
    repository(name: "_graphql_handson", owner: "FlutterKaigi") {
      description
      createdAt
      name
      issues(
        states: OPEN
        first: 100
        orderBy: { field: CREATED_AT, direction: DESC }
      ) {
        nodes {
          id
          body
          updatedAt
          title
          url
        }
      }
    }
  }
""";