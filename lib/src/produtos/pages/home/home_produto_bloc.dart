import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delivery_flutter_app/src/produtos/models/produto_model.dart';
import 'package:delivery_flutter_app/src/produtos/repositories/produto_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeProdutoBloc extends BlocBase {
  final ProdutoRepository produtoRepository;

  HomeProdutoBloc(this.produtoRepository);

  Future<bool> addProduto(ProdutoModel produtoModel) {
    return produtoRepository.addProduto(produtoModel);
  }

  Future<ProdutoModel> getProdutoById(String id) {
    return produtoRepository.getProdutoById(id);
  }

  
  Function(String) get searchAdd => _searchController.add;

  final _searchController = BehaviorSubject.seeded("");

  //Filtra os produtos
  Observable<List<ProdutoModel>> get produtos => _searchController.stream
      .switchMap((v) => produtoRepository.produtos)
      .map((data) => data
          .where((test) => _searchController?.value == null
          //Caso seja null ele retorna "true" ou seja.. todos os produtos sao validos
              ? true
              : test.name.toUpperCase().contains(_searchController.value.toUpperCase()))
          .toList());

  void refreshList() {
    _searchController.add(null);
  }

  @override
  void dispose() {
    _searchController.close();    
    super.dispose();
  }
}
