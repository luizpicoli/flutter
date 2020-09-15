import 'package:flutter/material.dart';
import 'package:residencial2/pages/menu_drawer.dart';
import 'package:residencial2/pages/plantas_page.dart';
import 'package:residencial2/pages/servico_page.dart';
import 'package:residencial2/pages/teste_page.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de suporte de T.I'),
      ),
      drawer: MenuDrawer(),
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: <Widget>[
        _titulo(),
        _fotos(),
        _botoes(context),
      ],
    );
  }

  Container _titulo() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Center(
        child: Text(
          'Ordem de serviço',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Container _fotos() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: PageView(
        children: <Widget>[
          _foto('teste_1.jpg'),
          _foto('teste2.jpg'),
          _foto('teste3.jpg'),
          _foto('teste4.jpg'),
          _foto('teste5.jpg'),
        ],
      ),
    );
  }

  Image _foto(String path) {
    return Image.asset(
      'assets/images/' + path,
      fit: BoxFit.contain,
    );
  }

  Column _botoes(BuildContext context) {
    return Column(
      children: <Widget>[
        _botao('Produtos de Informatica', _mostraPlantas, context),
        _botao('Cadastro de Cliente', _mostraPlanos, context),
        _botao('Serviços', _registreInteresse, context),
      ],
    );
  }

  RaisedButton _botao(String texto, Function telaNav, BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
// sem parâmetros, pode chamar direto
//      onPressed: telaNav,
      onPressed: () {
        telaNav(context);
      },
    );
  }

  _mostraPlantas(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantasPage()),
    );
  }

  _mostraPlanos(BuildContext context) {
   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServicoPage()),
    );
  }

  _registreInteresse(BuildContext context) {
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestePage()),
    );
  }
}
