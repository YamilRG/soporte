import 'package:flutter/material.dart';
import 'package:soporte/models/menu_options.dart';
import 'package:soporte/screens/screens.dart';
import 'package:soporte/router/app_routes.dart';

class HomeScreen_final extends StatelessWidget {
  final opciones = AppRoutes.opciones;
  HomeScreen_final({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView.separated(
            padding: EdgeInsets.all(24),
            itemBuilder: (context, i) => ListTile(
              leading: Icon(opciones[i].icon, color: Colors.black),
              title: Text(opciones[i].name),
              onTap: () {
                Navigator.pushNamed(context, opciones[i].route);
              },
            ),
            itemCount: opciones.length,
            separatorBuilder: (_, __) => const Divider(
              color: Colors.black,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'GAFI SOPORTE',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, 'pc');
                    },
                    child: const ListTile(
                      title: Text(
                        'Escritorio',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Image(
                        image: AssetImage("assets/Desktop.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, 'laptop');
                    },
                    child: const ListTile(
                      title: Text(
                        'Laptop',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Image(
                        image: AssetImage("assets/laptop.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, 'Storage');
                    },
                    child: const ListTile(
                      title: Text(
                        'Almacenamiento',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Image(
                        image: AssetImage("assets/storage.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, 'Impresoras');
                    },
                    child: const ListTile(
                      title: Text(
                        'Impresoras',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Image(
                        image: AssetImage("assets/pinters.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushNamed(context, 'laptop');
                    },
                    child: const ListTile(
                      title: Text(
                        'Destruccion',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Image(
                        image: AssetImage("assets/trash.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
