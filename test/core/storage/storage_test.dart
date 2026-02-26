import 'package:flutter_test/flutter_test.dart';
import 'package:your_gym_bro/core/storage/storage.dart';
  import 'package:shared_preferences/shared_preferences.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUp(() async {
    final storage = await Storage.getInstance();
    await storage.clear();
  });

  group('Storage Singleton & Methods', () {
    testWidgets('Storage is singleton', (tester) async {
      final s1 = await Storage.getInstance();
      final s2 = await Storage.getInstance();
      expect(identical(s1, s2), true);
    });

    testWidgets('set/get String', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setString('str', 'hello');
      expect(await storage.getString('str'), 'hello');
    });

    testWidgets('set/get Bool', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setBool('bool', true);
      expect(await storage.getBool('bool'), true);
    });

    testWidgets('set/get Int', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setInt('int', 42);
      expect(await storage.getInt('int'), 42);
    });

    testWidgets('set/get Double', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setDouble('double', 3.14);
      expect(await storage.getDouble('double'), 3.14);
    });

    testWidgets('remove', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setString('remove', 'bye');
      await storage.remove('remove');
      expect(await storage.getString('remove'), null);
    });

    testWidgets('clear', (tester) async {
      final storage = await Storage.getInstance();
      await storage.setString('clear', 'bye');
      await storage.clear();
      expect(await storage.getString('clear'), null);
    });
  });
}
