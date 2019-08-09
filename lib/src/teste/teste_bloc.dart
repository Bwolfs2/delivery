import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class TesteBloc extends BlocBase {
  
  TesteBloc() {
    control01.addListener(() {
      change();
    });
    control02.addListener(() {
      change();
    });
  }

  var control01 = TextEditingController();
  var control02 = TextEditingController();
  var control03 = TextEditingController();

  change() {
    var var01 = double.tryParse(control01.text) ?? 0;
    var var02 = double.tryParse(control02.text) ?? 0;

    control03.text = "R\$ ${var01 + var02}";
  }

  @override
  void dispose() {
    super.dispose();
  }
}
