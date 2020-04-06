import 'package:Covid_app/corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() => runApp(MaterialApp(
  home: Corona(),
  debugShowCheckedModeBanner: false,
));

class Corona extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CoronaState createState() => _CoronaState();
}

class _CoronaState extends State<Corona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sanjivani',
        style: TextStyle(
          fontSize: 23,
        ),),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.arrow_forward),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> Covid()
              ));
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body:SingleChildScrollView(
        child:Container(
          height:1100,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,8,40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text("What is Corona?"
                           "\nCoronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus. Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment. Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.\n",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),),),
                    ],
                  ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,60),
                  child: Center(
                   child: Image.asset("images/corona.jpg")),
                  ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,20),
                child:Column(
                  children: <Widget>[
                    Text("Symptoms",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                      ),),
                SizedBox(
                  height: 30.0,
                ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex:5,
                                child: Image.asset("images/fever.jpg"),),
                            Text("FEVER"),
                            Expanded(flex: 6,
                                child: Image.asset("images/cough.jpg")),
                            Text("COUGH"),
//                            Expanded(
//                                flex:5,
//                                child: Image.asset("images/headache.jpg")),
//                            Text("HEADACHE"),
                            Expanded(flex: 5,
                                child: Image.asset("images/breath.jpg"),),
                            Text("SORE"'\nTHROAT'),
                          ],

                        ),
                    ),
                  ],

                ),

//              child: FlatButton(
//                color: Colors.lightBlueAccent,
//
//                onPressed: (){},
//                ),
                ),
              ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child:Column(
                  children: <Widget>[
                    Text("Prevention",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue,
                      ),),
                    SizedBox(
                      height: 1.0,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Text("1.Wash your hands regularly with soap and water, or clean them with alcohol-based hand rub."
                               "\n2. Maintain at least 1 metre distance between you and people coughing or sneezing."
                                "\n3. Avoid touching your face."
                                "\n4.Cover your mouth and nose when coughing or sneezing."
                                 "\n5.Stay home if you feel unwell."
                                  "\n6.Refrain from smoking and other activities that weaken the lungs."
                                    "\n7. Practice physical distancing by avoiding unnecessary travel and staying away from large groups of people.",
                                 style: TextStyle(
                                   fontSize: 18,

                                 )),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ),
              ),

                ],
            ),
      ),),
    );
  }
}


