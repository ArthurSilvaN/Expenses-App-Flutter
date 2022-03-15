import 'dart:developer';
import 'dart:io';

void main() {
  Process.run(
    'flutter packages pub run build_runner build --delete-conflicting-outputs',
    [],
    runInShell: true,
  ).then((result) {
    log(result.stdout.toString());
    log(result.stderr.toString());
  });
}
