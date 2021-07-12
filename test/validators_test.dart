import 'package:flutter_test/flutter_test.dart';
import '../lib/helpers/validators.dart';

void main() {
  group(
    'Validators',
    () {
      group(
        'Email',
        () {
          test(
            'should return error string if empty',
            () {
              final result = Validators.validateEmail('');
              expect(result, 'Email can\'t be empty');
            },
          );

          test(
            'should return null if not empty',
            () {
              final result = Validators.validateEmail('email');
              expect(result, null);
            },
          );
        },
      );
      group(
        'Password',
        () {
          test(
            'should return error string if empty',
            () {
              final result = Validators.validatePassword('');
              expect(result, 'Password can\'t be empty');
            },
          );

          test(
            'should return null if not empty',
            () {
              final result = Validators.validatePassword('password');
              expect(result, null);
            },
          );
        },
      );
    },
  );
}
