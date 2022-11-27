import 'package:flutter/material.dart';
import 'package:mis_libros/models/result.dart';
import 'package:mis_libros/repository/sitie_api.dart';

class SearchSitiePage extends StatefulWidget {
  const SearchSitiePage({Key? key}) : super(key: key);

  @override
  State<SearchSitiePage> createState() => _SearchSitiePageState();
}



class _SearchSitiePageState extends State<SearchSitiePage> {

  SitieApi _sitieApi = SitieApi();

  final _parametro = TextEditingController();

  List<Results> listSities =<Results>[];

  Future _searchSitie() async{
    Result resultFuture = await _sitieApi.getSitie(_parametro.text);
    setState(() {
      resultFuture.results?.forEach(
              (element) {
                listSities.add(element);
              }
              );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Geoapify sitie"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(children: [
            TextFormField(
              controller: _parametro,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite nombre del sitio"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)
              ),
              onPressed: (){
                _searchSitie();
              },
              child: const Text("Buscar Sitio"),
            ),
            Expanded(child: ListView.builder(
                itemCount: listSities.length,
                itemBuilder: (BuildContext context, int index){
                  Results sitie = listSities[index];
                  return Card(
                    child: ListTile(
                      leading: const Image(image: AssetImage('assets/images/foto.jpg')),
                      title: Text(sitie.formatted ?? "No titles"),
                      subtitle: Text(sitie.country ?? "No subtitle"),
                    ),
                  );
                },
            ),
            ),
          ]),
        ),
      ),
    );
  }
}
