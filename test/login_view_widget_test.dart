import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_renting_app/auth/bloc/login/login_bloc.dart';
import 'package:home_renting_app/auth/data-provider/auth-data-provider.dart';
import 'package:home_renting_app/auth/repository/authRepository.dart';
import 'package:home_renting_app/auth/screens/login_view.dart';
import 'package:home_renting_app/chat/data_providers/chat-data-provider.dart';
import 'package:home_renting_app/chat/repository/chat-repository.dart';
import 'package:home_renting_app/main.dart';
import 'package:home_renting_app/rental/data_providers/rental-data-provider.dart';
import 'package:home_renting_app/rental/repository/rental-repository.dart';

void main() {
  testWidgets('Login view widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(
            authenticationRepository: AuthenticationRepository(
                dataProvider: AuthenticationDataProvider())),
        child: LoginView(),
      ),
    ));

    var emailField = find.byIcon(Icons.person);
    expect(emailField, findsOneWidget);

    var passwordField = find.byIcon(Icons.security);

    expect(passwordField, findsOneWidget);

    var loginButton = find.text("Login");
    expect(loginButton, findsOneWidget);

    
  });
}
