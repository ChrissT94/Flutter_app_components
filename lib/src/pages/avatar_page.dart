import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              child: Text('CT'),
              backgroundColor: Colors.red,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://fotografias.antena3.com/clipping/cmsimages01/2019/10/09/B82BA1CA-B8D2-489D-B31D-3C635C43EB9E/58.jpg'),
              radius: 30.0,

            ),
          )

        ],
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: FadeInImage(
            image: NetworkImage('https://miro.medium.com/max/1187/1*0FqDC0_r1f5xFz3IywLYRA.jpeg'),
            placeholder: AssetImage('assets/chriss.jpg'), 
            fadeInDuration: Duration( milliseconds: 200),
            ),
        ),
      ) ,
      

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fast_rewind),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}