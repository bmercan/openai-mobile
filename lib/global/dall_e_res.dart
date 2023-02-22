enum Resolutions {
  high,
  medium,
  low,
}

extension ResolutionExtension on Resolutions {
  String get res {
    switch (this) {
      case Resolutions.high:
        return '1024x1024';
      case Resolutions.medium:
        return '512x512';
      case Resolutions.low:
        return '256x256';
    }
  }
}
