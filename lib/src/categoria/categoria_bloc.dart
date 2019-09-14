import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CategoriaBloc extends BlocBase {

  CategoriaBloc(){
    percent = Observable.combineLatest2<bool , bool , double>(nomeController, emailController, (a,b)=> a && b ? 300 : a || b ? 150 : 0);
  }

  final nomeController = BehaviorSubject.seeded(false);
  final emailController = BehaviorSubject.seeded(false);

  Observable<double> percent;
 
  @override
  void dispose() {    
    nomeController.close();
    emailController.close();
    super.dispose();
  }
}
