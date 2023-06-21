import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'models/listpessoamodel.dart';
import 'modules/cadastro/cadastro_page.dart';
import 'modules/home_page/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ListPessoaModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/home',
          child: (_, __) => Provider<ListPessoaModel>.value(
            value: Modular.get<ListPessoaModel>(),
            child: HomePage(),
          ),
        ),
        ChildRoute(
          '/cadastro_page',
          child: (_, __) => Provider<ListPessoaModel>.value(
            value: Modular.get<ListPessoaModel>(),
            child: CadastroPage(),
          ),
        ),
      ];
}
