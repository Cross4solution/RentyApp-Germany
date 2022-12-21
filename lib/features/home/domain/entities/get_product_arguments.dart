class GetProductArguments {
  int page;

  GetProductArguments({
    this.page = 5,
  });

  Map<String, dynamic> toMap() {
    return {'page': page};
  }
}
