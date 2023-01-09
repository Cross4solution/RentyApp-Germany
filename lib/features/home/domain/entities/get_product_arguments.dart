class GetProductArguments {
  int page;

  GetProductArguments({
    this.page = 1,
  });

  Map<String, dynamic> toMap() {
    return {"page": page};
  }
}
