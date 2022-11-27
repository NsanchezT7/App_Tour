import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/login.dart';
import 'package:mis_libros/pages/new_sitie.dart';
import 'package:mis_libros/pages/search_sitie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Menu {logout,search}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis sitios"),
        actions: [
            PopupMenuButton(
              onSelected: (Menu item){
                setState(() {
                  if(item == Menu.logout){
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                  }else if(item ==Menu.search){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchSitiePage()));
                  }
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem(
                  value: Menu.search, child: Text('Buscar sitio'),
                ),
                const PopupMenuItem(
                  value: Menu.logout, child: Text('Cerra sesion'),
                ),
              ]
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("sities")
              .snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData) return const Text('loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                QueryDocumentSnapshot sitie =snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(sitie['name']),
                    subtitle: Text(sitie['city']+','+sitie['depart']),

                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewSitie()));
        },
        tooltip: 'New Sitie',
        child: const Icon(Icons.add_location),
      ),
    );
  }
}
