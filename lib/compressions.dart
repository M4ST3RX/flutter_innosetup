/// Different levels for supported compression algorithms in Inno Setup.
enum InnoSetupCompressionLevel {
  /// Fast compression (worst).
  fast._('fast'),

  /// Normal compression.
  normal._('normal'),

  /// Max compression.
  max._('max'),

  /// Ultra compression.
  ultra._('ultra'),

  /// Ultra 64 compression (best).
  ultra64._('ultra64');

  const InnoSetupCompressionLevel._(this.value);

  /// The compression level.
  final String value;
}

/// Defines compression level in Inno Setup.
///
/// Refer [InnoSetupCompression], [InnoSetupCompression.range].
///
class InnoSetupCompression {
  /// Defines compression level with a [name] in Inno Setup.
  ///
  /// ```dart
  /// const none = InnoSetupCompression('none');  // -> 'none'
  /// ```
  const InnoSetupCompression(
    this.name, {
    this.solid = false,
  });

  /// Defines a compression with a [name] and possible [range].
  ///
  /// Compression range must be in between 1 and 9.
  ///
  /// ```dart
  /// const zip = InnoSetupCompression.range('zip', 2);  // -> zip/2
  /// ```
  factory InnoSetupCompression.range(
    String name,
    int range, {
    bool solid = false,
  }) {
    assert(
      range >= 1 && range <= 9,
      'Compression range must be in between 1 and 9.',
    );
    return InnoSetupCompression('$name/$range', solid: solid);
  }

  /// Defines a compression with a [name] and possible [level].
  ///
  /// Refer [InnoSetupCompressionLevel] for [level].
  ///
  /// ```dart
  /// const zip = InnoSetupCompression.range('zip', 2);  // -> zip/2
  /// ```
  factory InnoSetupCompression.level(
    String name,
    InnoSetupCompressionLevel level, {
    bool solid = false,
  }) =>
      InnoSetupCompression('$name/${level.value}', solid: solid);

  /// The compression name.
  final String name;

  /// Solid Compression or not.
  ///
  /// Solid Compression causes all files to be compressed at once instead of separately.
  /// This can result in a much greater overall compression ratio if your installation contains many files with common content, such as text files, especially if such common content files are grouped together within the [Files] section.
  /// The disadvantage to using solid compression is that because all files are compressed into a single compressed stream, Setup can no longer randomly access the files. This can decrease performance.
  final bool solid;

  @override
  String toString() => '''
Compression=$name
SolidCompression=${solid ? 'yes' : 'no'}
''';
}

/// Contains multiple compression definitions for Inno Setup.
/// source: https://jrsoftware.org/ishelp/topic_setup_compression.htm
class InnoSetupCompressions {
  /// Contains multiple compression definitions for Inno Setup.
  /// source: https://jrsoftware.org/ishelp/topic_setup_compression.htm
  ///
  /// Returns a singletone class.
  factory InnoSetupCompressions() => _singleton;

  InnoSetupCompressions._();

  static final _singleton = InnoSetupCompressions._();

  /// No compression.
  static const none = InnoSetupCompression('none');

  /// Apply zip compression with [range].
  ///
  /// Refer [InnoSetupCompression.range].
  ///
  InnoSetupCompression zip(int range) =>
      InnoSetupCompression.range('zip', range);

  /// Apply bzip compression with [range].
  ///
  /// Refer [InnoSetupCompression.range].
  ///
  InnoSetupCompression bzip(int range) =>
      InnoSetupCompression.range('bzip', range);

  /// Apply lzma compression with [level].
  ///
  /// Refer [InnoSetupCompressionLevel] for possible [level].
  ///
  InnoSetupCompression lzma(InnoSetupCompressionLevel level) =>
      InnoSetupCompression.level('lzma', level);

  /// Apply lzma2 compression with [level].
  ///
  /// Refer [InnoSetupCompressionLevel] for possible [level].
  ///
  InnoSetupCompression lzma2(InnoSetupCompressionLevel level) =>
      InnoSetupCompression.level('lzma2', level);
}
