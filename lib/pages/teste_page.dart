import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart' show timeDilation;

//import 'package:flutter/scheduler.dart' show timeDilation;

class TestePage extends StatefulWidget {
  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, email, celular, cidade, _rbPeca, _rbTipo;

  get checkedValue => null;

  get hint => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Serviços'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Descrisão do Problema '),
          maxLength: 40,
          validator: _validarNome,
          onSaved: (String val) {
            nome = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Numero de serie'),
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: _validarCelular,
            onSaved: (String val) {
              celular = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Orçamento'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
            validator: _validarEmail,
            onSaved: (String val) {
              email = val;
            }),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Observações'),
          maxLength: 40,
          validator: _validarCidade,
          onSaved: (String val) {
            cidade = val;
          },
        ),
        DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text('troca peças'),
              value: 'troca peças',
            ),
            DropdownMenuItem<String>(
              child: Text('formatação'),
              value: 'formatação',
            ),
            DropdownMenuItem<String>(
              child: Text('instalação de programas'),
              value: 'instalação de programas',
            ),
          ],
          onChanged: (String value) {
            setState(() {
              _rbPeca = value;
            });
          },
          hint: Text('Seleciona tipo de serviço'),
          value: _rbPeca,
        ),
        ListTile(
          title: const Text('Compatador'),
          leading: Radio(
            value: 'Compatador',
            groupValue: _rbTipo,
            onChanged: (value) {
              setState(() {
                _rbTipo = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Notebook'),
          leading: Radio(
            value: 'N',
            groupValue: _rbTipo,
            onChanged: (value) {
              setState(() {
                _rbTipo = value;
              });
            },
          ),
        ),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendForm,
          child: new Text('Enviar'),
        )
      ],
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o problema";
    } else if (!regExp.hasMatch(value)) {
      return "O problema deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o numero de serie";
    } else if (value.length != 10) {
      return "O celular deve ter 10 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número de serie so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern =
        r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o orçamento";
    } else if (!regExp.hasMatch(value)) {
      return "orçamento";
    } else {
      return null;
    }
  }

  String _validarCidade(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe sua observações";
    } else if (!regExp.hasMatch(value)) {
      return "A observações deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Descrisão do Problema $nome");
      print("Numero de serie $celular");
      print("'Orçamento $email");
      print("Observações $cidade");
      print("Tipo de serviço $_rbPeca");
      print("Tipo de  $_rbTipo");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
