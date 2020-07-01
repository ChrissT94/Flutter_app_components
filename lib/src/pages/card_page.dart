import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          _addCards(),
          SizedBox(height: 20,),
          _addCardsImage(),
          SizedBox(height: 20,),
          
        ],
      ),
    );
  }

  
  Widget _addCards() {
    return Card(
      elevation: 10.0 ,
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Christian Torres'),
            subtitle:
                Text('UNIVERSIDAD TÉCNICA DE AMBATO'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.cancel),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _addCardsImage(){

    final card= Container(
      
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://depor.com/resizer/xCN5diXSlv_uswb5ae-SKAdlmtc=/1200x1200/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/RALZSE3SM5H7NCTSAKCQ7ZQ4AQ.jpg'),
            placeholder: AssetImage('assets/wait_image.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Iron man')
            )
        ],
      ),
    );

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[

        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.9, 10.0)
        )

      ]
      //color: Colors.red
    ),
    child: ClipRRect(
      child: card,
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
  }

}


