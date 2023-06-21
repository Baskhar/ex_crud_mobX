import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../models/listpessoamodel.dart';
import '../../models/pessoa_model.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();

  void _adicionarPessoa() {
    if (_formKey.currentState!.validate()) {
      var nome = _nomeController.text.trim();
      var cpf = _cpfController.text.trim();

      final listPessoaModel = Modular.get<ListPessoaModel>();
      listPessoaModel.adicionarPessoa(PessoaModel(
          nome: nome,
          cpf: int.parse(cpf))); // Corrigir a chamada para listPessoaModel
      Modular.to.pop(); // Voltar para a tela anterior (home)
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Página de Cadastro'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nomeController,
                textAlign: TextAlign.center,
                style: TextStyle(),
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _cpfController,
                textAlign: TextAlign.center,
                style: TextStyle(),
                decoration: InputDecoration(
                  hintText: 'CPF',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um CPF.';
                  }

                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Por favor, insira apenas números inteiros no CPF.';
                  }
                  return null;
                },
                // Defina a configuração de input somente números inteiros
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(250, 50)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                ),
                onPressed: _adicionarPessoa,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
