import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AddProdutoPage extends StatefulWidget {
  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  double bottomPadding = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          FormBuilder(            
            key: _fbKey,
            initialValue: {
              'date': DateTime.now(),
              'accept_terms': false,
            },
            autovalidate: true,
            child: Column(              
              children: <Widget>[
                FormBuilderTextField(
                  attribute: "name",
                  decoration: InputDecoration(labelText: "Nome:"),
                ),
                SizedBox(height: 25,),
                FormBuilderTextField(
                  attribute: "description",
                  decoration: InputDecoration(labelText: "Descrição:"),
                ),
                SizedBox(height: 25,),
                FormBuilderTextField(
                  attribute: "price",
                   decoration: InputDecoration(labelText: "Preço:"),
                ),
                SizedBox(height: 25,),
                FormBuilderDropdown(
                  attribute: "categoria_id",
                  decoration: InputDecoration(labelText: "Categoria:"),
                  // initialValue: 'Male',
                  hint: Text('Selecione uma Categoria'),
                  validators: [FormBuilderValidators.required()],
                  items: ['Refri', 'Farinha', 'Carne']
                      .map((gender) => DropdownMenuItem(
                          value: gender, child: Text("$gender")))
                      .toList(),
                ),
                SizedBox(height: 25,),
                FormBuilderChipsInput(
                  attribute: "condiments",
                   decoration: InputDecoration(labelText: "Condimentos:"),
                  maxChips: 5,
                  chipBuilder: (_, state, data) {
                    return InputChip(
                      key: ObjectKey(data),
                      label: Text(data),
                      avatar: CircleAvatar(
                        child: Text(data.substring(0, 2)),
                      ),
                      onDeleted: () => state.deleteChip(data),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    );
                  },
                  suggestionBuilder: (context, state, data) {
                    return ListTile(
                      key: ObjectKey(data),
                      leading: CircleAvatar(
                        child: Text(data.substring(0, 2)),
                      ),
                      title: Text(data),
                      subtitle: Text(data),
                      onTap: () => state.selectSuggestion(data),
                    );
                  },
                  findSuggestions: (String query) {
                    if (query.length != 0) {
                      var lowercaseQuery = query.toLowerCase();
                      return ["Cebola", "Pão", "Carne",'10','11','12','13','14','15','16','17','18','19'].where(
                        (data) {
                          return data
                              .toLowerCase()
                              .contains(query.toLowerCase());
                        },
                      ).toList(growable: false)
                        ..sort(
                          (a, b) =>
                              a.toLowerCase().indexOf(lowercaseQuery).compareTo(
                                    b.toLowerCase().indexOf(lowercaseQuery),
                                  ),
                        );
                    } else {
                      return const ["Cebola", "Pão", "Carne",'10','11','12','13','14','15','16','17','18','19'];
                    }
                  },
                ),
               
              ],
            ),
          ),
           Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                )
        ],
      ),
    );
  }
}
