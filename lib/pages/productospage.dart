import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductosPage extends StatefulWidget {
  const ProductosPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProductosPage> {
  List list = [
    "Comerciales",
    "Productos",
    "Locales",
    "Otros...",
  ];

  List<Offset> puntosSeleccionados = [];

  @override
  void initState() {
    super.initState();
    cargarPuntosGuardados();
  }

  void cargarPuntosGuardados() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? puntosString = prefs.getStringList('puntosSeleccionados');
    if (puntosString != null) {
      setState(() {
        puntosSeleccionados = puntosString
            .map((coord) {
          List<String> coords = coord.split(',');
          double x = double.parse(coords[0]);
          double y = double.parse(coords[1]);
          return Offset(x, y);
        })
            .toList();
      });
    }
  }

  void guardarPuntos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> puntosString = puntosSeleccionados
        .map((punto) => "${punto.dx},${punto.dy}")
        .toList();
    prefs.setStringList('puntosSeleccionados', puntosString);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GFSearchBar(
            searchList: list,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                  item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListItemBuilder: (item) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            onItemSelected: (item) {
              setState(() {
                print('$item');
              });
            },
          ),
          GestureDetector(
            onTapUp: (TapUpDetails details) {
              // Obtenemos las coordenadas del toque
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              Offset localPosition = renderBox.globalToLocal(details.globalPosition);

              setState(() {
                // Agregamos el punto seleccionado a la lista
                puntosSeleccionados.add(localPosition);
                // Guardamos los puntos
                guardarPuntos();
              });
            },
            child: Stack(
              children: [
                Image.asset('assets/verticalplano.png'),
                // Dibujamos los puntos seleccionados
                ...puntosSeleccionados.map((punto) {
                  return Positioned(
                    left: punto.dx - 12,
                    top: punto.dy - 12,
                    child: Icon(Icons.location_on, color: Colors.red, size: 24),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
