import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inicio_screen.dart';
import 'buscar_screen.dart';
import 'perfil_screen.dart';
import '../widgets/drawer_item.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas para cada opción de navegación
  static final List<Widget> _pages = <Widget>[
    InicioScreen(),
    BuscarScreen(),
    PerfilScreen(),
  ];

  // Cambia la pantalla mostrada al seleccionar una opción
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.flutter_dash, size: 40, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _selectedIndex == 0
                      ? 'Inicio'
                      : _selectedIndex == 1
                          ? 'Buscar'
                          : 'Perfil',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notificaciones')),
                );
              },
            ),
            IconButton(
              icon: Icon(
                themeProvider.isDarkMode ? Icons.wb_sunny : Icons.bedtime_sharp,
              ), // Ícono para cambiar el tema
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Menú de Opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerItem(
                icon: Icons.home,
                title: 'Inicio',
                index: 0,
                onTap: _onItemTapped,
                selectedIndex: _selectedIndex),
            DrawerItem(
                icon: Icons.search,
                title: 'Buscar',
                index: 1,
                onTap: _onItemTapped,
                selectedIndex: _selectedIndex),
            DrawerItem(
                icon: Icons.person,
                title: 'Perfil',
                index: 2,
                onTap: _onItemTapped,
                selectedIndex: _selectedIndex),
          ],
        ),
      ),
    );
  }
}
