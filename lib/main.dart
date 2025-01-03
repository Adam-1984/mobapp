import 'package:flutter/material.dart';
import 'mywidget.dart';
import 'pizza.dart';
import 'dart:convert'as convert;
import 'package:http/http.dart' as http;

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
  void fetchPizzaPrice(int size, String ingredients) async {

    try {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2/pizza/selectsize.php?size=$size&ingredients=$ingredients'));
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);

        if (jsonResponse.containsKey('totalPrice')) {
          setState(() {
            int quantity = int.parse(qcontroller.text);
            result = "The total price is \$${jsonResponse['totalPrice']*quantity}";
          });
        } else {
          setState(() {
            result = "Failed to fetch pizza price. Invalid response.";
          });
        }
      } else {
        setState(() {
          result = "Failed to fetch pizza price. Server error.";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error occurred: $e";
      });
    }
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
            ElevatedButton(
              onPressed: () {
                List<String> selectedIngredients = [];


                if (FreshBasil) selectedIngredients.add("Fresh Basil");
                if (CherryTomatoes) selectedIngredients.add("Cherry Tomatoes");
                if (FreshMozzarella) selectedIngredients.add("Mozzarella");
                if (ArtichokeHeart) selectedIngredients.add("Artichoke Heart");


                String ingredients = selectedIngredients.join(',');


                if (ingredients.isNotEmpty) {
                  fetchPizzaPrice(currentpizza.size, ingredients);
                } else {
                  setState(() {
                    result = "Please select at least one ingredient.";
                  });
                }
              },
              child: Text("Get Price", style: TextStyle(fontSize: 24, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            )
            ,

            SizedBox(height: 20,),
            Text('$result',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}







