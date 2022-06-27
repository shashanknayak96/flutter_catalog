int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(1000).toInt();
}
