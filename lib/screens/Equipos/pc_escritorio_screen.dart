import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;
String? _value;

class Pc_Escritorio_Screen extends StatelessWidget {
  Pc_Escritorio_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return showBottomSheet(context, false, null);
                    });
              }),
        ),
        appBar: AppBar(
          title: Text('Prueba de Todo'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: _db.collection('PC').snapshots(),
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
              itemBuilder: (context, int index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                return ListTile(
                  title: Card(
                      child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/logoXme.png'),
                        fit: BoxFit.cover,
                      ),
                      Text(
                        documentSnapshot['Prueba'],
                      ),
                    ],
                  )),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return showBottomSheet(
                              context, true, documentSnapshot);
                        });
                  },
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 15),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        size: 40,
                      ),
                      onPressed: () {
                        _db.collection('PC').doc(documentSnapshot.id).delete();
                      },
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

showBottomSheet(
    BuildContext context, bool isUpdate, DocumentSnapshot? documentSnapshot) {
  // Added the isUpdate argument to check if our item has been updated
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              // Used a ternary operator to check if isUpdate is true then display
              // Update Todo.
              labelText: isUpdate ? 'Actualizar' : 'Añadir',
              hintText: 'Escribe el Artículo',
            ),
            onChanged: (String _val) {
              // Storing the value of the text entered in the variable value.
              _value = _val;
            },
          ),
        ),
        TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlueAccent),
            ),
            onPressed: () {
              // Check to see if isUpdate is true then update the value else add the value
              if (isUpdate) {
                _db.collection('PC').doc(documentSnapshot?.id).update({
                  'Prueba': _value,
                });
              } else {
                _db.collection('PC').add({'Prueba': _value});
              }
              Navigator.pop(context);
            },
            child: isUpdate
                ? const Text(
                    'Actualizar',
                    style: TextStyle(color: Colors.white),
                  )
                : const Text('Añadir', style: TextStyle(color: Colors.white))),
      ],
    ),
  );
}
