import 'package:delivery_flutter_app/src/teste/teste_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:delivery_flutter_app/src/teste/teste_page.dart';

class TesteModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TesteBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TestePage();

  static Inject get to => Inject<TesteModule>.of();
}
