bool equals(Map a, Map b) {
  for (int i = 0; i < a.length; i++) {
    if (a.values.elementAt(i) != b.values.elementAt(i)) {
      return false;
    }
  }
  return true;
}
