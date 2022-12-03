// ignore_for_file: constant_identifier_names

enum Collections { TEST }

extension CollectionExtension on Collections {
  String stateToCollection() {
    switch (this) {
      case Collections.TEST:
        return "test";
      default:
        return "";
    }
  }
}
