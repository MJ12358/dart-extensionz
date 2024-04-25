import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  final Uri uri = Uri(
    scheme: 'https',
    userInfo: 'user:password',
    host: 'example.com',
    port: 80,
    pathSegments: <String>['path'],
    queryParameters: <String, String>{'query': 'hello'},
    fragment: 'fragment',
  );

  test('addPath', () {
    final Uri t1 = uri.addPath('hello').addPath('world');
    expect(
      t1.toString(),
      'https://user:password@example.com:80/path/hello/world?query=hello#fragment',
    );
  });

  test('addQuery', () {
    final Uri t1 = uri.addQuery('test1', 'value1').addQuery('test2', 'value2');
    expect(
      t1.toString(),
      'https://user:password@example.com:80/path?query=hello&test1=value1&test2=value2#fragment',
    );
  });

  test('copyWith', () {
    final Uri t1 = uri.copyWith(
      scheme: 'http',
      userInfo: 'user:123456',
      host: 'example.net',
      port: 443,
      pathSegments: <String>['newPath'],
      queryParameters: <String, String>{'query': 'world'},
      fragment: 'newFragment',
    );
    expect(
      t1.toString(),
      'http://user:123456@example.net:443/newPath?query=world#newFragment',
    );
  });
}
