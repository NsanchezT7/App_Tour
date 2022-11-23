import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/sitie.dart';
import '../repository/firebase_api.dart';

class NewSitie extends StatefulWidget {
  const NewSitie({Key? key}) : super(key: key);

  @override
  State<NewSitie> createState() => _NewSitieState();
}

class _NewSitieState extends State<NewSitie> {
  final FirebaseApi _firebaseApi= FirebaseApi();
  final _name = TextEditingController();
  final _city = TextEditingController();
  final _depart = TextEditingController();
  final _Temp = TextEditingController();
  final _descr = TextEditingController();

  double _rating = 3.0;

  void _showMsg(String msg){
    final scaffold =ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _createSitie(Sitie sitie) async{
    var result = await _firebaseApi.createSitie(sitie);
    _showMsg (result);
    Navigator.pop(context);
  }

  void _saveSite() {
    var sitie= Sitie("",_name.text,_city.text,_depart.text,_Temp.text,_descr.text,_rating);
    _createSitie(sitie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Sitio"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nombre'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _city,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Ciudad'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _depart,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Departamento'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _Temp,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Temperatura'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _descr,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Descripcion'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    _saveSite();
                  },
                  child: const Text('Guardar Sitio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
