import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CountrySelection(),
));

class CountrySelection extends StatefulWidget {
  @override
  _CountrySelectionState createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [

            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xFF1F1F1F),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back,color: Colors.white,)),
            ),
             SizedBox(width: 15,),
             Text('Country Selection',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildCountryTile('USA', 'united-states.png'),
          buildCountryTile('France', 'france.png'),
          buildCountryTile('India', 'india.png'),
          buildCountryTile('Germany', 'germany.png'),
          buildCountryTile('Finland', 'finland.png'),
          buildCountryTile('Hungary', 'hungary.png'),
          buildCountryTile('Cameroon', 'cameroon.png'),
        ],
      ),
    );
  }

  Widget buildCountryTile(String country, String asset) {
    return ListTile(
      title: Text(country, style: TextStyle(color: Colors.white),),
      leading: Image.asset("assets/CountryIcons/$asset", scale: 12,),
      trailing: InkWell(
        onTap: () {
          setState(() {
            selectedCountry = country;
          });
        },
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          child: selectedCountry == country ? Icon(Icons.circle, color: Colors.white, size: 12,) : null,
        ),
      ),
    );
  }
}