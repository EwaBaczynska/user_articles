import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

class MockAuthorsDataSource extends Mock
    implements AuthorsRemoteRetrofitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorsDataSource dataSource;

  setUp(() {
    dataSource = MockAuthorsDataSource();
    sut = AuthorsRepository(remoteDataSource: dataSource);
  });

  group('getAuthorModels', () {
    test('should call remoteDataSource.getAuthors() method', () async {
      //1
      when(() => dataSource.getAuthors()).thenAnswer((_) async => []);

      //2
      await sut.getAuthorModels();
      //3
      verify(() => dataSource.getAuthors()).called(1);
    });

    test('should return the list of authors', () async {
      //1
      when(
        () => dataSource.getAuthors(),
      ).thenAnswer((_) async => [
            AuthorModel(1, 'pic', 'Ewa', 'A'),
            AuthorModel(2, 'pic', 'Kasia', 'B'),
            AuthorModel(3, 'pic', 'Asia', 'C'),
            AuthorModel(4, 'pic', 'Basia', 'D'),
          ]);
      //2
      final results = await sut.getAuthorModels();
      //3
      expect(results, [
        AuthorModel(1, 'pic', 'Ewa', 'A'),
        AuthorModel(2, 'pic', 'Kasia', 'B'),
        AuthorModel(3, 'pic', 'Asia', 'C'),
        AuthorModel(4, 'pic', 'Basia', 'D'),
      ]);
    });
  });
}
