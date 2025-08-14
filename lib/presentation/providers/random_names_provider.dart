import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

/* final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
  yield ['Alice', 'Bob', 'Charlie', 'David'];
  await Future.delayed(const Duration(seconds: 2));

  yield ['Eve', 'Frank', 'Grace', 'Heidi'];
  await Future.delayed(const Duration(seconds: 2));
}); */

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  await for (final name in RandomGenerator.getRandomNamesStream()) {
    yield name;
  }
});