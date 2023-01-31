import 'dart:io';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('extension', () {
    expect(File('test.txt').extension, 'txt');
    expect(File('/documents/test.png').extension, 'png');
    expect(File('C:\\Users\\test.mp4').extension, 'mp4');
    expect(File('~/root/test.mp3').extension, 'mp3');
    expect(File('test/noextension').extension, 'test/noextension');
  });

  test('mimeType', () {
    expect(File('test.txt').mimeType, 'text/plain');
    expect(File('/documents/test.png').mimeType, 'image/png');
    expect(File('C:\\Users\\test.mp4').mimeType, 'video/mp4');
    expect(File('~/root/test.mp3').mimeType, 'audio/mpeg');
    expect(File('test/noextension').mimeType, '');
  });

  test('type', () {
    expect(File('test.txt').type, FileType.text);
    expect(File('/documents/test.png').type, FileType.image);
    expect(File('C:\\Users\\test.mp4').type, FileType.video);
    expect(File('~/root/test.mp3').type, FileType.audio);
    expect(File('test/noextension').type, FileType.unknown);
  });
}
