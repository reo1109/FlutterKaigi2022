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

