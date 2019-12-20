import 'dart:io';
import 'package:test/test.dart';
import 'package:mixer/middleware/file_storage.dart';
import 'package:mixer/models/drink.dart';

void main() {
    group('File Storage', () {
        final directory = Directory.systemTemp.createTemp('__storage_test__');

        tearDownAll() async {
            final tempDir = await directory;
            tempDir.deleteSync(recursive: true);
        }

        test('saveDrinks-loadDrinks results in same drinks', () async {
            final storage = FileStorage('test_file', () => directory);
            List<Drink> drinks = [
                Drink(
                    1,
                    'Test Drink',
                    'Rum', 
                    'Coupe',
                    ['Ingredient 1', 'Ingredient 2'],
                    'Some fancy instructions',
                ),
                Drink(
                    2,
                    'Another Test Drink',
                    'Bourbon', 
                    'Rocks',
                    ['Bourbon', 'Rocks'],
                    'Nothing fancy here',
                ),
            ];

            storage.saveDrinks(drinks);
            List<Drink> actual = await storage.loadDrinks();
            expect(actual, drinks);
        });
    });

}
