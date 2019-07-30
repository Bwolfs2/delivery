import 'package:delivery_flutter_app/src/produtos/repositories/produto_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'pages/add/add_produto_bloc.dart';
import 'pages/home/home_produto_bloc.dart';
import 'pages/home/home_produto_page.dart';

class ProdutoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeProdutoBloc(i.get<ProdutoRepository>())),
        Bloc((i) => AddProdutoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => ProdutoRepository()),
      ];

  @override
  Widget get view => HomeProdutoPage();

  static Inject get to => Inject<ProdutoModule>.of();
}
