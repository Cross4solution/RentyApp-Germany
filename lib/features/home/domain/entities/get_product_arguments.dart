class GetProductArguments {
  int page;

  GetProductArguments({
    this.page = 4,
  });

  Map<String, dynamic> toMap() {
    return {'page': page};
  }
}
