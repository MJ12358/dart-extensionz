part of dart_extensionz;

/// [Uri] Extension.
extension UriExtension on Uri {
  Uri addPath(String value) {
    final List<String> segments = List<String>.of(pathSegments);
    segments.add(value);
    return copyWith(
      pathSegments: segments,
    );
  }

  Uri addQuery(String key, String value) {
    final Map<String, String> parameters =
        Map<String, String>.of(queryParameters);
    parameters.update(
      key,
      (String value) => value,
      ifAbsent: () => value,
    );
    return copyWith(
      queryParameters: parameters,
    );
  }

  String? get _scheme => scheme.isNotBlank ? scheme : null;
  String? get _userInfo => userInfo.isNotBlank ? userInfo : null;
  String? get _host => host.isNotBlank ? host : null;
  int? get _port => port;
  Iterable<String>? get _pathSegments =>
      pathSegments.isNotEmpty ? pathSegments : null;
  Map<String, String>? get _queryParameters =>
      queryParameters.isNotEmpty ? queryParameters : null;
  String? get _fragment => fragment;

  Uri copyWith({
    String? scheme,
    String? userInfo,
    String? host,
    int? port,
    Iterable<String>? pathSegments,
    Map<String, String>? queryParameters,
    String? fragment,
  }) {
    return Uri(
      scheme: scheme ?? _scheme,
      userInfo: userInfo ?? _userInfo,
      host: host ?? _host,
      port: port ?? _port,
      pathSegments: pathSegments ?? _pathSegments,
      queryParameters: queryParameters ?? _queryParameters,
      fragment: fragment ?? _fragment,
    );
  }
}
