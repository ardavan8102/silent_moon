Duration? parseDuration(String? value) {
  if (value == null || value.isEmpty) return null;

  final parts = value.split(':').map(int.tryParse).toList();

  if (parts.any((p) => p == null)) return null;

  if (parts.length == 3) {
    return Duration(
      hours: parts[0]!,
      minutes: parts[1]!,
      seconds: parts[2]!,
    );
  }

  if (parts.length == 2) {
    return Duration(
      minutes: parts[0]!,
      seconds: parts[1]!,
    );
  }

  if (parts.length == 1) {
    return Duration(seconds: parts[0]!);
  }

  return null;
}