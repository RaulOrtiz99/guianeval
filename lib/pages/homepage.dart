import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sigproyect/pages/productospage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProductosPage(),
    Container(child: Text("Pagina2"),),
    Container(child: Text("Pagina3"),),
    Container(child: Text("Pagina2"),),
    Container(child: Text("Pagina3"),),
  ];




  @override
  Widget build(BuildContext context) {
    List list = [
      "Flutter",
      "React",
      "Ionic",
      "Xamarin",
    ];
    return Scaffold(

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey,),
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store,),
            label: 'Comercios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mi ubicacion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Rutas',
          ),
        ],
      ),
    );
  }
}

