import 'package:flutter/material.dart';
import 'package:ssd_frontend/Favoritos.dart';
import 'package:ssd_frontend/Interesses.dart';
import 'package:ssd_frontend/AboutUS.dart';
import 'package:ssd_frontend/registo_empresas/registo.dart';
import 'package:ssd_frontend/registo_empresas/signUp_pessoa.dart';
import 'features_empresa/features_empresa.dart';
import 'login/login_turista.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String _distrito = '';
  String _concelho = '';
  String _categoria = '';

  List<String> _categorias = [    'Restauração',    'Eventos',    'Praias',    'Passadiços',    'Turismo Local'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Distrito',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _distrito = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Concelho',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _concelho = value!,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
                items: _categorias
                    .map((categoria) => DropdownMenuItem<String>(
                  value: categoria,
                  child: Text(categoria),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _categoria = value!;
                  });
                },
                onSaved: (value) => _categoria = value!,
                value: _categoria,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  // Implementar ação de pesquisa aqui, utilizando as variáveis _distrito, _concelho e _categoria
                },
                child: Text('Pesquisar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
