import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../models/listpessoamodel.dart';
import '../cadastro/cadastro_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listPessoaModel = Provider.of<ListPessoaModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: Observer(
        builder: (_) {
          return ListView.separated(
            itemCount: listPessoaModel.pessoas.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(); // Adiciona uma linha de divisão entre os itens
            },
            itemBuilder: (_, index) {
              final pessoa = listPessoaModel.pessoas[index];
              return ListTile(
                title: Text(pessoa.nome),
                subtitle: Text('CPF: ${pessoa.cpf}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro_page');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
