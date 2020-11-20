import 'package:flutter/material.dart';
import 'package:fortline_app/QrReader.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("FortLine Demo",
            style: TextStyle(
              color: Colors.white
            ),
            ),
            Image.asset("images/fortline.png",
              width: 40,
              height: 40,
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(0, 60, 87, 1),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fortline_factory.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Container(
          color: Colors.black54,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("images/fortline_logo.png",
                width: 250,
              ),
              SizedBox(height: 70),
              InkWell(
                onTap: ()=> Navigator.push(context,
                MaterialPageRoute(builder: (_)=> QrReader())),
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color.fromRGBO(0, 60, 87, 1)
                  ),
                  child: Center(
                    child: Text("Abrir Leitor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ),
            ],
          ),
          ),
      )
    );
  }
}