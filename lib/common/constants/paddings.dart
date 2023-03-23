enum AppPadding {
  /// 0
  none(0),

  /// 4
  extraTiny(2),

  /// 4
  tiny(4),

  /// 8
  extraSmall(8),

  /// 12
  small(12),

  /// 16
  normal(16),

  /// 20
  secondaryNormal(20),

  /// 24
  large(24),

  /// 48
  extraLarge(48);

  final double size;

  const AppPadding(this.size);
}
