import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  test('truthy', () {
    final MemoryFileSystem fs = MemoryFileSystem();
    final Directory dir = fs.directory('/');
    final File file = fs.file('test.txt');
    final Link link = fs.link('/');

    expect(dir.isDirectory, true);
    expect(dir.isFile, false);
    expect(dir.isLink, false);
    expect(file.isDirectory, false);
    expect(file.isFile, true);
    expect(file.isLink, false);
    expect(link.isDirectory, false);
    expect(link.isFile, false);
    expect(link.isLink, true);
  });

  test('truthyNullable', () {
    const Directory? dir = null;
    const File? file = null;
    const Link? link = null;

    expect(dir.isDirectory, false);
    expect(dir.isFile, false);
    expect(dir.isLink, false);
    expect(file.isDirectory, false);
    expect(file.isFile, false);
    expect(file.isLink, false);
    expect(link.isDirectory, false);
    expect(link.isFile, false);
    expect(link.isLink, false);
  });
}
