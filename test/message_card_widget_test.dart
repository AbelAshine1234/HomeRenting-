import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_renting_app/auth/bloc/login/login_bloc.dart';
import 'package:home_renting_app/auth/data-provider/auth-data-provider.dart';
import 'package:home_renting_app/auth/repository/authRepository.dart';
import 'package:home_renting_app/auth/screens/update_account.dart';
import 'package:home_renting_app/chat/Custom/MessageCard.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_bloc.dart';
import 'package:home_renting_app/chat/data_providers/chat-data-provider.dart';
import 'package:home_renting_app/chat/repository/chat-repository.dart';
import 'package:home_renting_app/chat/screens/chat_page.dart';

import 'package:home_renting_app/rental/blocs/blocs.dart';
import 'package:home_renting_app/rental/blocs/image/image_bloc.dart';
import 'package:home_renting_app/rental/data_providers/rental-data-provider.dart';
import 'package:home_renting_app/rental/repository/rental-repository.dart';
import 'package:home_renting_app/rental/screens/rental_add_update.dart';
import 'package:home_renting_app/routes.dart';

void main() {
  testWidgets('Message card widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: Center(
          child: MessageCard(
              message: "message",
              time: "timjkhkjhkhkjhkhkjkhke",
              senderName: "senderName"),
        ),
      )),
    );

    var text = find.byType(Text);
    expect(text, findsWidgets);
    var stack = find.byType(Stack);
    expect(stack, findsWidgets);
    var align = find.byType(Align);
    expect(align, findsOneWidget);
  });
}
