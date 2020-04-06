import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}
class _CovidState extends State<Covid> {
  bool loading = true;
  List countryData;
  Future <String> _getWorldData() async{
    var response = await http.get("http://brp.com.np/covid/country.php");
    var getData = json.decode(response.body);
    if(this.mounted){
      setState(() {
        loading = false;
        countryData =[getData];
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
      _getWorldData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.update), onPressed: (){ _getWorldData();})
          ],
          title:Text('Sanjivani',style: TextStyle(fontSize: 23),)
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
              shrinkWrap: true,
              physics:NeverScrollableScrollPhysics(),
              itemCount: countryData == null?0 : countryData[0]["countries_stat"].length,
              itemBuilder: (context,i)
              {
                return listItem(i);
              })
        ],

      ),
    );
  }
  Widget listItem(int i){
    return Column(
      children: <Widget>[
        Center(
          child: Text(countryData[0]["countries_stat"][i]["country_name"],
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),) ,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["active_cases"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('INFECTED',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Expanded(
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["deaths"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('DEATH',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Expanded(
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["total_recovered"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('RECOVERED',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.tealAccent,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["new_cases"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('NEW CASES',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Expanded(
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["serious_critical"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('CRITICAL CASES',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Expanded(
              child: Container(
                color: Colors.cyan,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(countryData[0]["countries_stat"][i]["total_cases_per_1m_population"],
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
                    Text('CASES PER 1m ''\nPOPULATION',
                      style: TextStyle(
                        color: Colors.black,
                      ),),

                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}