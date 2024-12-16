import 'package:flutter/material.dart';
import 'pizza.dart';
class myRadioButton extends StatefulWidget {
Pizza pizza;
final Function (int) Updatepizza ;
myRadioButton({super.key, required this.pizza, required this.Updatepizza});

@override
State<myRadioButton> createState() => _myRadioButtonState();
}

class _myRadioButtonState extends State<myRadioButton> {

  //1 for adult and 2 for youth
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Radio<int>(value: 1,
          groupValue:widget.pizza.size,
          onChanged: (val){
            if (val != null) {
              setState(() {
                widget.Updatepizza(val);
              });
            }


          },
          activeColor: Colors.red[900],
          hoverColor: Colors.red[300],
          focusColor: Colors.red[500],
        ),
        Text('Small',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),
        Radio(value: 2,
          groupValue:widget.pizza.size,
          onChanged: (val){
            if (val != null) {
              setState(() {
                widget.Updatepizza(val);
              });
            }

          },
          activeColor: Colors.red[900],
          hoverColor: Colors.red[300],
          focusColor: Colors.red[500],
        ),
        Text('Medium',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),
        Radio(value: 3,
          groupValue:widget.pizza.size,
          onChanged: (val){
            if (val != null) {
              setState(() {
                widget.Updatepizza(val);
              });
            }

          },
            activeColor: Colors.red[900],
            hoverColor: Colors.red[300],
            focusColor: Colors.red[500],
        ),
        Text('Family',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold)),
      ],

    );
  }
}