import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _itemsList = new List();
  int _addLast = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();



  @override
  void initState() {
    super.initState();
     _agregar10();
    _scrollController.addListener((){

      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
       _fetchData();
      }


    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLoading(),
         _llamarListViewBuilder(),

        ],
      )
    );
  }

  Widget _llamarListViewBuilder(){
      return RefreshIndicator(
        onRefresh: _obtenerPag1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _itemsList.length,
        itemBuilder: (BuildContext context, int index){
          final _imageIndex = _itemsList[index];
          return FadeInImage(
            image: NetworkImage('https://i.picsum.photos/id/$_imageIndex/200/300.jpg'),
            placeholder: AssetImage('assets/wait_image.gif'), 
            );
        },

        ),
      );
  }

  void _agregar10(){
    for (var i = 1; i <= 10 ; i++) {
      _addLast++;
      _itemsList.add(_addLast);   
    }
    setState(() {
      
    });
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {
    
    final _duration = new Duration(seconds: 2) ;
    new Timer(_duration , requestHTTP);
      
    });
  } 
 void requestHTTP(){
   _isLoading = false;
   _scrollController.animateTo(
     _scrollController.position.pixels +100,
     duration: Duration(milliseconds: 250),
     curve: Curves.fastOutSlowIn
  );

   _agregar10();
 }

 Widget _crearLoading(){

   if (_isLoading) {

     return Column(
       mainAxisSize:  MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              SizedBox(height: 65.0,),
             CircularProgressIndicator(),
           ],
         ),
       ],
     );
     
   }else{
     return Center();
   }
 }

 Future<Null> _obtenerPag1()async{
   final _duration = new Duration(seconds: 2); 
   new Timer(_duration, (){
     _itemsList.clear();
     _addLast++;
     _agregar10();
   });

   return Future.delayed(_duration);
 }

}