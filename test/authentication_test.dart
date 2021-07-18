import 'package:flutter_test/flutter_test.dart';
import 'package:kazang_demo/blocs/auth_bloc.dart';
import 'package:kazang_demo/blocs/auth_state.dart';
import 'package:kazang_demo/repositories/auth_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements AuthRepository {}

void main() {
  AuthBloc authBloc;
  MockUserRepository authRepository;
  setUp(() {
    authRepository = MockUserRepository();
    authBloc = AuthBloc(authRepository: authRepository);
  });
  tearDown(() {
    authBloc?.close();
  });

  test('initial state is correct', () {
    expect(authBloc.state, AuthInitial());
  });

  test('close does not emit new states', () {
    expectLater(authBloc, emitsInOrder([AuthInitial(), emitsDone]));
    authBloc.close();
  });
  group('AuthenticationTest -', () {
    test('************ Test try test ', () {
      final expectedResponse = [AuthInitial(), AuthLoadFailure()];

      when(authRepository.loginWithUserNameAndPassword(
              username: 'david', password: '123456'))
          .thenAnswer((_) => Future.value(
              authRepository.loginWithUserNameAndPassword(
                  username: 'david', password: '123456')));
      expectLater(
        authBloc,
        emitsInOrder(expectedResponse),
      );
      authBloc.add(AuthenticationTest());
    });
  });
}
