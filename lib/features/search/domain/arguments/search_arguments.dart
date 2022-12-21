class SearchArguments {
  final String keyword;

  SearchArguments({required this.keyword});

  Map<String, dynamic> toMap() {
    return {
      "q": keyword,
    };
  }
}
