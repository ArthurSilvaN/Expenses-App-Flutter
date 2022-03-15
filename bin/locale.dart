import 'dart:developer';
import 'dart:io';

void main() {
  Process.run(
    'flutter pub run intl_utils:generate',
    [],
    runInShell: true,
  ).then((result) {
    log(result.stdout.toString());
    log(result.stderr.toString());
  });
}
