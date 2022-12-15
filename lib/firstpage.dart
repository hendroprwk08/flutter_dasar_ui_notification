import 'package:flutter/material.dart';

const String _title = 'FIRST PAGE';

//stateless karena tak ada event dalam form ini
class firstpage extends StatelessWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon( Icons.arrow_back ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(_title), //judul untuk ditampilkan pada AppBar
          backgroundColor: Color(0x666666aa) //HEX Colors
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width, //fit to parent
                  child: Text("1st PAGE")
                  ),
                ),
              );
        },
      ),
    );
  }
}
