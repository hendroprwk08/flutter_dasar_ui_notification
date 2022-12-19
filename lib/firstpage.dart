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
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue,
            margin: EdgeInsets.all(50.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("1st PAGE", style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  ElevatedButton(
                    child: new Text('CLOSE THIS PAGE'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]

            ),
          );
        },
      ),
    );
  }
}
