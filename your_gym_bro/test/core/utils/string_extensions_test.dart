import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/core/utils/string_extensions.dart';

void main() {
  group('isValidEmail', () {
    test('returns true for a standard email', () {
      expect('user@example.com'.isValidEmail, isTrue);
    });

    test('returns true for email with dots and plus', () {
      expect('first.last+tag@sub.domain.com'.isValidEmail, isTrue);
    });

    test('returns true for email with numbers', () {
      expect('user123@domain.co'.isValidEmail, isTrue);
    });

    test('returns false for missing @ symbol', () {
      expect('userdomain.com'.isValidEmail, isFalse);
    });

    test('returns false for missing domain', () {
      expect('user@'.isValidEmail, isFalse);
    });

    test('returns false for missing TLD', () {
      expect('user@domain'.isValidEmail, isFalse);
    });

    test('returns false for empty string', () {
      expect(''.isValidEmail, isFalse);
    });

    test('returns false for spaces in email', () {
      expect('user @example.com'.isValidEmail, isFalse);
    });

    test('returns false for single char TLD', () {
      expect('user@domain.c'.isValidEmail, isFalse);
    });
  });

  group('isValidPassword', () {
    test('returns true for password meeting all requirements', () {
      expect('Abcdef1!'.isValidPassword, isTrue);
    });

    test('returns true for longer valid password', () {
      expect('MyStr0ng@Pass'.isValidPassword, isTrue);
    });

    test('returns true for password with various special chars', () {
      expect('Test123#abc'.isValidPassword, isTrue);
    });

    test('returns false when missing uppercase', () {
      expect('abcdef1!'.isValidPassword, isFalse);
    });

    test('returns false when missing lowercase', () {
      expect('ABCDEF1!'.isValidPassword, isFalse);
    });

    test('returns false when missing digit', () {
      expect('Abcdefg!'.isValidPassword, isFalse);
    });

    test('returns false when missing special character', () {
      expect('Abcdef12'.isValidPassword, isFalse);
    });

    test('returns false when shorter than 8 characters', () {
      expect('Ab1!xyz'.isValidPassword, isFalse);
    });

    test('returns false for empty string', () {
      expect(''.isValidPassword, isFalse);
    });

    test('returns false for only digits', () {
      expect('12345678'.isValidPassword, isFalse);
    });

    test('returns false for only letters', () {
      expect('Abcdefgh'.isValidPassword, isFalse);
    });

    test('returns true for exactly 8 characters meeting all rules', () {
      expect('Aa1!xxxx'.isValidPassword, isTrue);
    });
  });
}
