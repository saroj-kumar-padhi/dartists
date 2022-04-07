import 'package:dartists/priviews/exapanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
    @override
  void dispose() {
    super.dispose();

     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 )); // to re-show bars

  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        backgroundColor: Colors.redAccent[200],
        child:  Stack(
          children:[ 
            tiles(),
          ]
            ),
            ),
      appBar: AppBar(
        
        
    
                      backgroundColor: Colors.redAccent[200],
                     
    
                      toolbarHeight: 60,
    
                       elevation: 14,
    
                       shape: RoundedRectangleBorder(
    
                            borderRadius:
    
                                 BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
    
                                                    ),
    
                      title: Text('Dartists',),
    
    
                          ),
    
      
      body: Container(
      alignment: Alignment.center,
      child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => expanded_image()),
        );
      },
      child:  Hero(
        tag: "profile-image",
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
            width: 200,
            height: MediaQuery.of(context).size.height / 3,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4",
                ),
            fit: BoxFit.cover)),
              ),
        ),
        ),
      ),
    ));
  }
}

class tiles extends StatelessWidget {
  const tiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.fromLTRB(17, 40, 17, 20),
    child: Container(
      // color: Colors.green,
       width: MediaQuery.of(context).size.width,
    height:   MediaQuery.of(context).size.height*0.08,
    decoration:const  BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16),),  color: Colors.white, ),
          
      child: Padding(
        padding: const EdgeInsets.only(top:12,bottom: 10,left: 15 ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
          Icon(Icons.info_outline_rounded,color: Colors.black,),
        
          Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text("About",style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.black ),),
          ),
        ]),
      ),
    ),
    );
  }
}