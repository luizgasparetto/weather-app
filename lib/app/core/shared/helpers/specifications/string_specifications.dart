class StringSpecifications {
  static isSatisfiedBy(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    } else if (value.startsWith(' ') || value.endsWith(' ')) {
      return false;
    }

    return true;
  }
}
