class InnoSetupRegisty {
  /// Define optional registries
  const InnoSetupRegisty({
    required this.root,
    required this.subkey,
    required this.type,
    required this.name,
    this.value,
  });

  /// Root key for registry (eg. HKLM)
  final String root;
  
  /// Subkey for registry
  final String subkey;

  /// Registry key type
  final String type;

  /// Registry name
  final String name;

  /// Registry value
  final String? value;
}

// ignore: public_member_api_docs
class InnoSetupRegistyBuilder {
  // ignore: public_member_api_docs
  const InnoSetupRegistyBuilder(this._registries);

  final List<InnoSetupRegisty> _registries;

  @override
  String toString() {
    final code = StringBuffer('[Registry]\n');

    for (final registry in _registries) {
      code.writeln('Root: ${registry.root}; Subkey: "${registry.subkey}"; ValueType: ${registry.type}; ValueName: "${registry.name}"; ValueData: "${registry.value ?? ''}"');
    }

    return '$code';
  }
}