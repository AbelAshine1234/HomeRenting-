import 'package:flutter/material.dart';
import 'package:home_renting_app/auth/data-provider/auth-data-provider.dart';
import 'package:home_renting_app/auth/model/Auth.dart';

class AuthenticationRepository {
  final AuthenticationDataProvider dataProvider;
  AuthenticationRepository({required this.dataProvider});

  Future<Authentication> register(Authentication authentication) async {
    return this.dataProvider.register(authentication);
  }

  Future<String> login(Authentication authentication) async {
    return this.dataProvider.login(authentication);
  }

  Future<Authentication> update(Authentication authentication) async {
    return this.dataProvider.update(authentication);
  }

  Future<void> delete() async {
    this.dataProvider.delete();
  }
}
