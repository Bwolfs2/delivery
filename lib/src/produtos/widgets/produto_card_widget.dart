import 'package:flutter/material.dart';

class ProdutoCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: FittedBox(
          fit: BoxFit.cover,
                  child: Material(
            color: Colors.white,
            elevation: 14,
            borderRadius: BorderRadius.circular(24),
            shadowColor: Color(0x802196f3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(   
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Text("Text 01 Icon: Icon(IconData(U+0E896), color: MaterialAccentColor(primary value: Color(0xff536dfe)))", style: TextStyle(fontSize: 36), maxLines: 1 , overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                        Text("Text 02", style: TextStyle(fontSize: 36),),
                        Text("Text 03", style: TextStyle(fontSize: 36),),                 
                      ],
                    ),
                  ),
                ),
                Container(        
                  width: 250,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image(
                      alignment: Alignment.topRight,
                      image: NetworkImage("http://midias.gazetaonline.com.br/_midias/jpg/2018/09/20/rest__maria_mariana__prato_paella_do_sertao-5791938.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

