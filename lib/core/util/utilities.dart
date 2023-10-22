

class Utilities {
  static getIdentifierName(dynamic identifier) {
    if (identifier is String) {
      return 'email';
    }
    return 'id';
  }

  static getBookIdentifierName(dynamic identifier) {
    if (identifier is String) {
      return 'barcode';
    }
    return 'id';
  }
}