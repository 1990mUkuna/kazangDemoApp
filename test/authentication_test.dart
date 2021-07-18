import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:kazang_demo/blocs/auth_bloc.dart';
import 'package:kazang_demo/blocs/auth_event.dart';
import 'package:kazang_demo/blocs/auth_state.dart';
import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_bloc.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/repositories/auth_repository.dart';
import 'package:kazang_demo/repositories/product_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:kazang_demo/models/user.dart';

//class MockUserRepository extends Mock implements AuthRepository {}
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  // AuthBloc authBloc;
  //MockUserRepository authRepository;
  ProductsBloc productBloc;
  MockProductRepository productRepository;
  setUp(() {
    // authRepository = MockUserRepository();
    productRepository = MockProductRepository();
    productBloc = ProductsBloc(productRepository: productRepository);

    //authBloc = AuthBloc(authRepository: authRepository);
  });
  tearDown(() {
    //authBloc?.close();
    productBloc?.close();
  });

  test('initial state is correct', () {
    //expect(authBloc.state, AuthInitial());
    expect(productBloc.state, ProductsInitial());
  });

  group('get products', () {
    final list = <ProductModel>[
      ProductModel(
          id: 1,
          logo: "logoooo",
          name: 'product 1',
          summary: "this is the summary")
    ];

    blocTest('api return results',
        build: () {
          when(productRepository.getProducts()).thenAnswer((_) async {
            return Future.value(list);
          });
        },
        act: (productBloc) => productBloc.add(ProductRequestedEvent()),
        expect: [
          ProductsInitial(),
          ProductsLoadInProgress(),
          ProductsLoadSuccess(products: list)
        ]);
  });

  /* test('api return results', () {
    final list = <ProductModel>[
      ProductModel(
          id: 1,
          logo: "logoooo",
          name: 'product 1',
          summary: "this is the summary")
    ];

    when(productBloc.productRepository.getProducts()).thenAnswer((_) async {
      return list;
    });

    productBloc.add(ProductRequestedEvent());

    expectLater(
        productBloc,
        emitsInOrder([
          ProductsInitial(),
          ProductsLoadInProgress(),
          ProductsLoadSuccess(products: list)
        ]));
  }); */

  /* test('api return results', () {
    final user =
        User(username: 'david', password: '123445', sessionId: "123455");

    when(authBloc.authRepository.loginWithUserNameAndPassword(
            username: 'david', password: '123456'))
        .thenAnswer((_) async {
      return Future.value(
          User(username: 'david', password: '123445', sessionId: "123455"));
    });

    expect(
        authBloc.state,
        emitsInOrder([
          AuthInitial(),
          AuthLoadInProgress(),
          AuthLoadSuccess(user: user)
        ]));

    authBloc
        .add(LoginUserEvent(username: user.username, password: user.password));
  }); */
/* 
  test('close does not emit new states', () {
    expectLater(authBloc, emitsInOrder([AuthInitial(), emitsDone]));
    authBloc.close();
  }); */
  /* group('AuthenticationTest -', () {
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
     // authBloc.add(AuthenticationTest());
    });
  }); */
}
