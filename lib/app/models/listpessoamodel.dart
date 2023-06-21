import 'package:crud_mobx/app/models/pessoa_model.dart';
import 'package:mobx/mobx.dart';

part 'listpessoamodel.g.dart';

class ListPessoaModel = _ListPessoaModelBase with _$ListPessoaModel;

abstract class _ListPessoaModelBase with Store {
  @observable
  ObservableList<PessoaModel> pessoas = ObservableList<PessoaModel>();

  @action
  void adicionarPessoa(PessoaModel pessoa) {
    pessoas.add(pessoa);
  }

  // @action
  // void removerPessoa(PessoaModel pessoa) {
  //   pessoas.remove(pessoa);
  // }
}
