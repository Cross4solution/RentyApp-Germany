// ignore_for_file: constant_identifier_names

class Querys {
  final QueryEnum queryEnum;
  final String? parameter;
  final dynamic jhg;

  Querys(this.queryEnum, this.parameter, this.jhg);
}

enum QueryEnum {
  WHERE,
  LIMIT,
  ORDER_BY,
}
