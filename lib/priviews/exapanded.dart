import 'package:flutter/material.dart';

class expanded_image extends StatelessWidget {
  const expanded_image({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        
    
                      backgroundColor: Colors.redAccent[200],
                     
    
                      toolbarHeight: 60,
    
                       elevation: 14,
    
                       shape: RoundedRectangleBorder(
    
                            borderRadius:
    
                                 BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
    
                                                    ),
    
                      title: Text('Dartists',),
    
    
                          ),
      body: Hero(
        tag: "profile-image",
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: Container(
              width:  MediaQuery.of(context).size.height / 2,
              height:  MediaQuery.of(context).size.height / 2,
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
    ));
  }
}