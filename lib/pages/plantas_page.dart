import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:residencial2/classes/planta.dart';

class PlantasPage extends StatefulWidget {
  @override
  _PlantasPageState createState() => _PlantasPageState();
}

class _PlantasPageState extends State<PlantasPage> {
  bool _grid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelos de Casas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            onPressed: () {
              // print('Lista');
              setState(() {
                _grid = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              // print('Grid');
              setState(() {
                _grid = true;
              });
            },
          ),
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    List<Planta> plantas = [
      Planta('hd.jpg', 'HD Interno 500GB', 250),
      Planta('fonte.jpg', 'fonte de alimentação 200w', 90),
      Planta('rodeator.jpg', 'rodeator wifi', 390),
      Planta('monitor.jpg', 'monitor 21', 520),
    ];

    if (_grid) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: plantas.length,
        itemBuilder: (BuildContext context, int index) {
          Planta planta = plantas[index];
          return _foto(planta.foto, planta.modelo, planta.preco);
        },
      );
    } else {
      return ListView.builder(
        itemCount: plantas.length,
        itemExtent: 300,
        itemBuilder: (BuildContext context, int index) {
          Planta planta = plantas[index];
          return _foto(planta.foto, planta.modelo, planta.preco);
        },
      );
    }
  }

  Stack _foto(String path, String modelo, double preco) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
          ),
          child: Image.asset(
            'assets/images/' + path,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.all(
              8,
            ),
            margin: EdgeInsets.all(
              4,
            ),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Modelo: $modelo\nPreço: ${NumberFormat.simpleCurrency(locale: 'pt_BR').format(preco)}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
