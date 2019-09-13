import 'package:delivery_flutter_app/src/categoria/categoria_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:delivery_flutter_app/src/categoria/categoria_page.dart';

class CategoriaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CategoriaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CategoriaPage();

  static Inject get to => Inject<CategoriaModule>.of();
}
