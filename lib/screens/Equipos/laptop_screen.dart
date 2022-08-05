import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

final _db = FirebaseFirestore.instance;
String? _value;
String? _nombre;
String? _tipo;
String? _numeroe;
String? _asignado;
String? _estado;

class Laptop_Screen extends StatelessWidget {
  const Laptop_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FloatingActionButton(
              backgroundColor: AppTheme.primary,
              child: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: const BorderRadius.vertical(
                          top: const Radius.circular(32)),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 10),
                        child: SizedBox(
                            height: 600,
                            child: _showBottomSheet(context, false, null)),
                      );
                    });
              }),
        ),
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          centerTitle: true,
          title: const Text('Laptop'),
        ),
        body: StreamBuilder(
          stream: _db.collection('Laptop').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int i) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[i];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(documentSnapshot['Numero Economico']),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: Text('Tipo:'),
                                  ),
                                  Text(documentSnapshot['Tipo']),
                                  const Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                    ),
                                    child: const Text('Estado:'),
                                  ),
                                  Text(documentSnapshot['Estado']),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: const Text('Asignado:'),
                                  ),
                                  Text(
                                    documentSnapshot['Asignado'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(32)),
                                ),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                      height: 600,
                                      child: _showBottomSheet(
                                          context, true, documentSnapshot));
                                });
                          },
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: IconButton(
                              icon: const Icon(Icons.delete_sharp),
                              onPressed: () {
                                _db
                                    .collection('Laptop')
                                    .doc(documentSnapshot.id)
                                    .delete();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            ;
          },
        ));
  }
}

// labelText: isUpdate ? 'Nombre' : 'Añadir Elemento',
_showBottomSheet(
    BuildContext context, bool isUpdate, DocumentSnapshot? documentSnapshot) {
  // final Map<String, String> formValues = {
  //   'Modelo': 'Modelo',
  // };
  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppTheme.primary,
                    ),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50)),
                  ),
                  width: 200,
                  child: Center(
                    child: isUpdate
                        ? const Text('Actualizar Laptop',
                            style: TextStyle(
                                color: AppTheme.primary, fontSize: 16))
                        : const Text(
                            'Añadir Laptop',
                            style: TextStyle(
                                color: AppTheme.primary, fontSize: 16),
                          ),
                    // child: Text(
                    //   'Añadir Laptop',

                    //   ),
                    // ),
                  ),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.laptop_rounded),
                  fillColor: AppTheme.primary,
                  border: OutlineInputBorder(),
                  labelText: 'Añadir Equipo',
                  hintText: 'Nombre del Equipo'),
              onChanged: (String _val) {
                _nombre = _val;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tipo',
                  hintText: 'Tipo (Laptop)'),
              onChanged: (String _val) {
                _tipo = _val;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero Economico',
                  hintText: 'Numero Economico'),
              onChanged: (String _val) {
                _numeroe = _val;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Asignado',
                  hintText: 'Nombre Propietario'),
              onChanged: (String _val) {
                _asignado = _val;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estado',
                  hintText: 'Estado'),
              onChanged: (String _val) {
                _estado = _val;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            child: isUpdate
                ? const Text('Actualizar',
                    style: TextStyle(color: Colors.white))
                : const Text(
                    'Añadir',
                    style: TextStyle(color: Colors.white),
                  ),
            onPressed: () {
              if (isUpdate) {
                _db.collection('Laptop').doc(documentSnapshot?.id).update({
                  'Nombre del Equipo': _nombre,
                  'Tipo': _tipo,
                  'Numero Economico': _numeroe,
                  'Asignado': _asignado,
                  'Estado': _estado,
                });
              } else {
                _db.collection('Laptop').add({
                  'Nombre del Equipo': _nombre,
                  'Tipo': _tipo,
                  'Numero Economico': _numeroe,
                  'Asignado': _asignado,
                  'Estado': _estado,
                });
              }
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppTheme.primary),
            ),
          )
        ],
      ),
    ),
  );
}





// SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: DropdownButtonFormField<String>(
//               value: 'CoreI3',
//               items: const [
//                 DropdownMenuItem(value: 'CoreI3', child: Text('CoreI3')),
//                 DropdownMenuItem(value: 'Modelo', child: Text('CoreI5')),
//                 DropdownMenuItem(value: 'Modelo', child: Text('CoreI7'))
//               ],
//               onChanged: (value) {
//                 formValues['Modelo'] = value ?? 'CoreI3';
//               },
//             ),
//           ),