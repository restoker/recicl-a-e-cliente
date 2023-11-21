import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'recicla',
      initialRoute: 'onboard',
      routes: {
        'onboard': (_) => OnboardPage(),
        'login': (_) => LoginPage(),
        'registro': (_) => RegistroPage(),
        'roles': (_) => RolesPage(),
        "cliente/home": (_) => ClienteHomePage(),
        'cliente/update': (_) => ClienteUpdatePage(),
        'cliente/address/list': (_) => ClienteAddressListaPage(),
        'cliente/ordenes/lista': (_) => ClienteOrdenesListaPage(),
        'empresa/crear': (_) => EmpresaCrearPage(),
        'empresa/productos/crear': (_) => EmpresaProductosCrearPage(),
        'admin/home': (_) => AdminHomePage(),
        'admin/empresas': (_) => AdminEmpresasPage(),
        'recicladora/home': (_) => EmpresaOrdenesListaPage(),
        'empresa/recolector/crear': (_) => EmpresaRecolectorCrearPage(),
        'recolector/home': (_) => RecolectorOrdenesListaPage(),
      },
    );
  }
}
