import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home : FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage>{
  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

InputDecoration buildInputDecoration(String label,IconData icon){
  return InputDecoration(
    labelText: label,
    fillColor: Color.fromARGB(255, 248, 248, 248),
    filled: true,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(),
    ),
    prefixIcon: Icon(icon),
  );
}
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Form Informatika'),
      centerTitle: true,
    ),
    body: Padding(padding: const EdgeInsets.all(24),child: Center(child: Column(
      children: [
        Text('Informatika Untirta', style: TextStyle(fontSize : 20),
        ),
        SizedBox(height: 20,),
        Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: buildInputDecoration('Nama', Icons.person),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nimController,
              decoration:buildInputDecoration('NIM', Icons.confirmation_num),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: alamatController,
              decoration: buildInputDecoration('Alamat', Icons.location_on),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(
                            nama: namaController.text,
                            nim: nimController.text,
                            alamat: alamatController.text,
                          ),
                        ),
                      );
                    }, child: Text('Kirim'))
          ],
        )
        
        
      ],
    ),),),
  );
}
}
class SecondPage extends StatelessWidget{
  final String nama;
  final String nim;
  final String alamat;

  SecondPage({required this.nama,required this.nim,required this.alamat});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Kedua'),
        centerTitle: true,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Nama : $nama'),
          Text('Nim : $nim'),
          Text('Alamat : $alamat'),
        ],
      ),)
    );
  }
}