import 'package:dartz/dartz.dart';
import 'package:flutter_appss/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_appss/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_appss/features/number_trivia/domain/usecases/get_concret_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  final tNomber = 1;
  final tNumberTrivia=NumberTrivia(number: 1,text: "text");
  test(
    'you should  get trivia for the number from the repository ',
    () async {
      //arrange
  when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
      .thenAnswer((_) async => Right(tNumberTrivia));
      //act
      final result=await usecase(Params(number: tNomber));
      //assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNomber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
