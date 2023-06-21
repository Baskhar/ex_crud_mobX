// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listpessoamodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListPessoaModel on _ListPessoaModelBase, Store {
  late final _$pessoasAtom =
      Atom(name: '_ListPessoaModelBase.pessoas', context: context);

  @override
  ObservableList<PessoaModel> get pessoas {
    _$pessoasAtom.reportRead();
    return super.pessoas;
  }

  @override
  set pessoas(ObservableList<PessoaModel> value) {
    _$pessoasAtom.reportWrite(value, super.pessoas, () {
      super.pessoas = value;
    });
  }

  late final _$_ListPessoaModelBaseActionController =
      ActionController(name: '_ListPessoaModelBase', context: context);

  @override
  void adicionarPessoa(PessoaModel pessoa) {
    final _$actionInfo = _$_ListPessoaModelBaseActionController.startAction(
        name: '_ListPessoaModelBase.adicionarPessoa');
    try {
      return super.adicionarPessoa(pessoa);
    } finally {
      _$_ListPessoaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pessoas: ${pessoas}
    ''';
  }
}
