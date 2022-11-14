import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:user_articles/domain/models/author_model.dart';

void main() {
  test('should getter name return first and second name and combined', () {
    //1 przygotowanie danych
    final model = AuthorModel(1, '', 'Ewa', 'Dziubaskowa');

    //2 wywołanie danych
    final result = model.name;

    //3 oczekiwania
    expect(result, 'Ewa Dziubaskowa');
  });
}
