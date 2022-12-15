import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String _title = 'SECOND PAGE ';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  late String nama, instansi, alamat;

  bool cWeb = false,
      cDesktop = false,
      cMobile = false,
      cGDesain = false,
      cAnimasi = false,
      cVideoEdit = false,
      swValue = false;

  int radioGroupValue = 0;

  double sliderValue = 5; //tidak boleh 0.0 untuk slider

  void radioMethod(value){
    setState((){
      radioGroupValue = value;
    });
  }

  void sliderMethod(value){
    setState((){
      sliderValue = value;
    });
  }

  void switchMethod(value){
    setState((){
      swValue = value;
    });
  }


  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(_title), //judul untuk ditampilkan pada AppBar
          backgroundColor: Color(0x666666aa) //HEX Colors
          ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
                width: MediaQuery.of(context).size.width, //fit to parent
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, //left
                        children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text('Biodata',
                            style: TextStyle(
                                color: Colors.lightBlue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 40)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          'Registrasi, harap isi dengan benar',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), // kotak dengan corner
                            labelText: 'Nama',
                            hintText: 'Nama Lengkap',
                          ),
                          onChanged: (String text) {
                            setState(() {
                              nama = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), // kotak dengan corner
                            labelText: 'Instansi',
                            hintText: 'Tempat Kerja, Sekolah atau Kampusmu',
                          ),
                          onChanged: (String text) {
                            setState(() {
                              instansi = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(), // kotak dengan corner
                            labelText: 'Alamat',
                            hintText: 'Sesuai domisili',
                          ),
                          onChanged: (String text) {
                            setState(() {
                              alamat = text;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Kemampuan',
                        textAlign: TextAlign.left,
                      ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                      value: this.cWeb,
                                      onChanged: (bool? x){ //? karena mungkin akan null
                                        setState((){
                                          this.cWeb = x!;//! cek apakah null?
                                          print('Web: '+ cWeb.toString());
                                        });
                                      }
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Web' )
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                      value: cDesktop,
                                      onChanged: (bool? x){
                                        setState((){
                                          this.cDesktop = x!;
                                          print('Desktop: '+ cDesktop.toString());
                                        });
                                      }
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Desktop' )
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                      value: cMobile,
                                      onChanged: (bool? x){
                                        setState(() {
                                          this.cMobile = x!;
                                          print('Mobile: '+ cMobile.toString());
                                        });
                                      }
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Mobile' )
                              ),

                            ],
                          ),
                          Text(
                            'Peminatan',
                            textAlign: TextAlign.left,
                          ),

                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Radio(
                                      value: 1, 
                                      groupValue: radioGroupValue, 
                                      onChanged: (int? rValue){ 
                                        radioMethod(rValue); 
                                      })
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Manajemen' )
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Radio(value: 2,
                                      groupValue: radioGroupValue,
                                      onChanged: (int? rValue){ 
                                        radioMethod(rValue); 
                                      })
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Int. Of Things' )
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Radio(
                                      value: 3, 
                                      groupValue: radioGroupValue, 
                                      onChanged: (int? rValue){ 
                                        radioMethod(rValue); 
                                      })
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Text( 'Robotika' )
                              ),

                            ],
                          ),
                          Text(
                            'Penampilan',
                            textAlign: TextAlign.left,
                          ),

                          Slider(
                              value: sliderValue,
                              min: 1.0,
                              max: 5.0,
                              onChanged: (double value){
                                String tempValue = value.toStringAsFixed(0); //konversi agar x.o (nol dibelakang)
                                sliderMethod( double.parse(tempValue) );
                              }
                          ),

                          Text(
                            sliderValue.toString(),
                            textAlign: TextAlign.left,
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
                            child: Text(
                              'Aktif',
                              textAlign: TextAlign.left,
                            ),
                          ),

                          Switch(
                              value: swValue,
                              onChanged: (bool value){
                                switchMethod(value);
                              }
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width, //fit to parent
                            child: ElevatedButton(
                              child: Text("LIHAT HASIL"),
                              onPressed: (){
                                Fluttertoast.showToast(
                                    msg: nama.trim() + ", " + instansi.trim() + ", "+ alamat.trim(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );

                                print( 'String values: '+ nama.trim() + ", " + instansi.trim() + ", "+ alamat.trim() );
                                print( 'Checkbox values: Web '+ cWeb.toString() + ", Desktop " + cDesktop.toString() + ", Mobile "+ cMobile.toString() );
                                print( 'Radiobox values: '+ radioGroupValue.toString() );
                              },
                            ),
                          ),
                        ])),
          ),
        );
      }),
    );
  }
}
