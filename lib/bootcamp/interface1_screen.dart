import 'package:flutter/material.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class Interface1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(child: Container(
                  color: Color(0xfff1f1f1),
                  child: Container(
                    child: Column(children: [
                      Flexible(child: Container(
                        padding: EdgeInsets.only(top: 20, left: 10),
                        alignment: Alignment.center,
                        child: ListTile(
                          title : Text('Hello,'),
                          subtitle: Text('grahacaesara', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.3)
                          ),
                        ),
                      )),
                      Flexible(
                        flex: 2,
                        child: InkWell(
                          onTap: (){
                           context.display(MusicBootCamp());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.3),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Container(
                              child: Row(
                                children : <Widget>[
                                  Flexible(flex: 2, child: Container(color: Colors.black12,
                                  // child: Column(
                                  //   children: <Widget>[
                                  //     Text('data'),
                                  //     Text('data'),
                                  //     Text('data'),
                                  //   ]
                                  // ),
                                  ),),
                                  Flexible(child: Container()),
                                ]
                              ),
                            ),
                          ),
                        )),
                      Flexible(child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.topLeft,
                              child: Text('Features'),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index)=> Container(
                                    child: Column(
                                      children : <Widget>[
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Container( 
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(.2),
                                                blurRadius: 2.0,
                                                offset: Offset(0, 3)
                                              )
                                            ]
                                          ),
                                        )),
                                        Text('Earbud', style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black54
                                        ),)
                                      ]
                                    ),
                                    width: 70,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.all(2),
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                ),

                            ))

                          ]
                        ),

                      )),
                    ],)
                  ),
                )),
                Flexible(child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children : <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text('News')
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text('See all', style: TextStyle(fontSize: 12, color: Colors.blue),)
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 7,
                        fit: FlexFit.loose,
                        child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index)=> Container(
                              height: MediaQuery.of(context).size.height,
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                                borderRadius : BorderRadius.all(Radius.circular(20))
                              ),
                              
                            )),
                        ),
                        )),
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.home,),
                                    Text('data')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.home, color: Colors.grey.withOpacity(.3),),
                                    Text('data')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.home, color: Colors.grey.withOpacity(.3),),
                                    Text('data')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.home, color: Colors.grey.withOpacity(.3),),
                                    Text('data')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.home, color: Colors.grey.withOpacity(.3),),
                                    Text('data')
                                  ],
                                ),
                                



                              ],

                            ),
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius : BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                           boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 19.0,
                                offset: Offset(3, 0)
                              )
                           ]

                        ),

                      ))
                    ]
                  ),
                ))
              ]
            ),
          ),
        ),
      );
  }
}



class MusicBootCamp extends StatefulWidget {
  @override
  _MusicBootCampState createState() => _MusicBootCampState();
}

class _MusicBootCampState extends State<MusicBootCamp> {

  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Container(child: Icon(Icons.apps)),
          actions: [
            Container(child: Icon(Icons.person))
          ],
        ),

        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Container(
                  child: Column(
                    children: [
                      Flexible(child: Container(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.topLeft,
                          child: Text('Browser', style: TextStyle(
                            color: Colors.white,
                            fontSize: 45
                          ),),
                        ),
                      )),
                      Flexible(child: Container(
                        child:TabBar(
                          indicatorColor: Colors.red,
                          tabs: [
                          Tab(child: Text('trending'),),
                          Tab(child: Text('popular'),),
                          Tab(child: Text('uniquely'),),
                            ]),
                      )),
                    ],
                  ),
                )),
                Flexible(
                  flex: 2,
                  child: Container(
                    child: Column(
                      
                    ),
                  )),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}