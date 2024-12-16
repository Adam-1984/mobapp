import 'package:flutter/material.dart';
import 'package:untitled3/mywidget.dart';
import 'package:untitled3/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController qcontroller=TextEditingController();
  bool FreshBasil = false;
  bool CherryTomatoes = false;
  bool ArtichokeHeart= false;
  bool FreshMozzarella = false;
  String result = '';
  Pizza currentpizza = Pizza();
  void updatesize(int size){
    setState(() {
      currentpizza.size=size;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar:
      AppBar(
        title: Text('Menu sec:pizza',style: TextStyle(fontSize: 34),),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,






      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              height: 60,
              width: 300,
              child: TextField(
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter how many pizza",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                ),
                controller: qcontroller,
                keyboardType: TextInputType.number,
                cursorColor: Colors.red[900],
              ),
            ),
        SizedBox(height: 20,)
        , 
        Text('Choose the pizza size', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
        ,
        SizedBox(height: 5,),
        myRadioButton(pizza: currentpizza, Updatepizza: (size){
          updatesize(size);

        }),



        SizedBox(height: 20,),
        Text("Add Ingredient",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Checkbox(
              value:FreshBasil ,
              onChanged: (bool? value) {
                setState(() {
                  FreshBasil = value!;
                });
              },
              activeColor: Colors.red[900],


            ),
            Text("Fresh Basil" ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
            SizedBox(width: 20,),
            Checkbox(
              value:CherryTomatoes,
              onChanged: (bool? value) {
                setState(() {
                  CherryTomatoes = value!;
                });
              },
              activeColor: Colors.red[900],



            ),
            Text("Cherry Tomatoes" ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),

          ],
        ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Checkbox(
                  value:FreshMozzarella ,
                  onChanged: (bool? value) {
                    setState(() {
                      FreshMozzarella = value!;
                    }
                    );

                  },
                  activeColor: Colors.red[900],


                ),
                Text("Mozzarella" ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),
                SizedBox(width: 30,),
                Checkbox(
                  value:ArtichokeHeart,
                  onChanged: (bool? value) {
                    setState(() {
                      ArtichokeHeart = value!;
                    });
                  },
                  activeColor: Colors.red[900],



                ),
                Text("Artichoke Heart" ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold)),

              ],
            ),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                try{
                  double quantity = double.parse(qcontroller.text);
                  double sum= 0;
                  if(FreshBasil){
                    sum+=2.5;
                  }
                  if(CherryTomatoes){
                    sum+=0.5;
                  }
                  if(FreshMozzarella){
                    sum+=1.5;
                  }
                  if(ArtichokeHeart){
                    sum+=3;
                  }
                  sum+= currentpizza.totalprice();

                    result = "the total price is ${sum*quantity} \$" ;
                  }
                catch(E){
                  result = "please enter a quatity";

                }
              });
            },
              child: Text("Done", style: TextStyle(fontSize: 24,color: Colors.white),),
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('$result',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}







