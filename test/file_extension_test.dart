import 'dart:io';
import 'dart:math';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    final String s = Platform.pathSeparator;
    expect(File('test.txt').name, 'test.txt');
    expect(File('${s}documents${s}test.png').name, 'test.png');
    expect(File('C:${s}Users${s}test.mp4').name, 'test.mp4');
    expect(File('~${s}root${s}test.mp3').name, 'test.mp3');
    expect(File('test${s}noextension').name, 'noextension');
  });

  test('extension', () {
    expect(File('test.txt').extension, 'txt');
    expect(File('/documents/test.png').extension, 'png');
    expect(File(r'C:\Users\test.mp4').extension, 'mp4');
    expect(File('~/root/test.mp3').extension, 'mp3');
    expect(File('test/noextension').extension, 'test/noextension');
  });

  test('mimeType', () {
    expect(File('test.txt').mimeType, 'text/plain');
    expect(File('/documents/test.png').mimeType, 'image/png');
    expect(File(r'C:\Users\test.mp4').mimeType, 'video/mp4');
    expect(File('~/root/test.mp3').mimeType, 'audio/mpeg');
    expect(File('test/noextension').mimeType, '');
  });

  test('type', () {
    expect(File('test.txt').type, FileType.text);
    expect(File('/documents/test.png').type, FileType.image);
    expect(File(r'C:\Users\test.mp4').type, FileType.video);
    expect(File('~/root/test.mp3').type, FileType.audio);
    expect(File('test/noextension').type, FileType.unknown);
  });

  test('size', () {
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    final File filex = File('nonexistant');

    final File file0 = fileSystem.file('testfile0.dart');
    file0.createSync();

    final File file1 = fileSystem.file('testfile1.dart');
    file1.writeAsBytes(<int>[1, 2, 3]);
    file1.createSync();

    final File file2 = fileSystem.file('testfile2.dart');
    file2.writeAsBytes(List<int>.generate(pow(1024, 1).toInt(), (int i) => i));
    file2.createSync();

    final File file3 = fileSystem.file('testfile3.dart');
    file3.writeAsBytes(List<int>.generate(pow(1024, 2).toInt(), (int i) => i));
    file3.createSync();

    expect(filex.size(), '');
    expect(file0.size(), '0 B');
    expect(file1.size(), '3 B');
    expect(file2.size(), '1 KB');
    expect(file3.size(), '1 MB');
  });
}
