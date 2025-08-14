import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {

  static String getRandomName() {
    final randomNames = RandomNames(Zone.japan);
    return randomNames.fullName();
  }

  static Stream<String> getRandomNamesStream() {

    return Stream.periodic(
      const Duration(seconds: 2),
      (i) {
        print('Generating random name: $i');
        return getRandomName();
      }
    );  
  }

}