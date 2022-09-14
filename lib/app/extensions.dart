extension NotNullString on String? {
  String orEmpty() => this ?? "";
}

extension NotNullInt on int? {
  int orZero() => this ?? 0;
}

extension NotNullDouble on double? {
  double orZero() => this ?? 0.0;
}

extension NotNullBool on bool? {
  bool orFalse() => this ?? false;
}
