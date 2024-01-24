import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'payment method'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedPaymentMethod="Credit Card";
  bool checked= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title.toUpperCase(),
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),),
      ),

      body: Container(

      //height: 500,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildCard(
                  Icon(Icons.credit_card, color:(selectedPaymentMethod==true)?Colors.blue:Colors.white , size: 45,), 
                  "Credit Card", 
                  (selectedPaymentMethod=="Credit Card")? true:false
                  ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildCard(
                    Icon(Icons.card_membership, size: 45, color:(selectedPaymentMethod==true)? Colors.white:Colors.blue,), 
                    "Debit", 
                    (selectedPaymentMethod=="Debit")?true:false,
                    ),
                ),
                buildCard(
                  Icon(Icons.paypal, size: 45 ,color:(selectedPaymentMethod==true)? Colors.white:Colors.blue,), 
                  "pay pal", 
                  (selectedPaymentMethod=="Debit")?true:false,
                  ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add, size:30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add new card"),
                  ),
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  height: 90,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black)
                  ),
                  
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Mastercard"),
                      ),
                       Row(
                        children:<Widget> [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.card_membership_outlined, size:30,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:50.0),
                            child: Text("1211"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:180.0),
                            child: Radio(
                            value: !checked, 
                            groupValue: !checked, 
                            onChanged: (value){
                              setState(() {
                                checked=!checked;
                              });
                            }
                            ),
                          ),
                  
                ],
              )
                              ],
                   ),
                ),
          ),

                    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                  height: 90,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Visa"),
                      ),
                       Row(
                        children:<Widget> [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.card_giftcard_rounded, size:30,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("*****"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("0772"),
                          ),
                  
                ],
              ),


                              ],
                   ),
                ),
          ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 390,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed:pay() , 
                            child: Text("pay now".toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(left:200.0),
                            child: Text("25.60 RS",style: TextStyle(color: Colors.white)),
                          )
                      ],
                    ),
                  )
                ),
              )
          


        ],
      ),

    )
    );
    
  }
  
  pay() {}
  
}






// functions:

Container buildCard(Icon icon, String title, bool status){
  return Container(
    height: 140,
    width: 120,
    decoration: BoxDecoration(
      color: (status==true)?
      Colors.blue:Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: (status==true)? Colors.blue:Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: icon,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize:20, 
              color:(status==true)?Colors.white:Colors.blue
              ),
            
          )
          
        ],
        
      ),
    ),
  );


}