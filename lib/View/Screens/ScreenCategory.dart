import 'package:flutter/material.dart';
import 'package:newsapp/Controller/api.dart';
import '../../constant.dart';
class ScreenCategory extends StatefulWidget {

  String Category;


  ScreenCategory(this.Category);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:backGround,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${widget.Category }News ",
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontxlarge
                  ),
                ),
              ),
              // Container(
              //   height:MediaQuery.of(context).size.height/14,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       CategoryBotton(textBotton:"sports",colorBotton:red),
              //       CategoryBotton(textBotton:"business",colorBotton:blue),
              //       CategoryBotton(textBotton:"science",colorBotton:red),
              //       CategoryBotton(textBotton:"entertainment",colorBotton:blue),
              //       CategoryBotton(textBotton:"general",colorBotton:red),
              //       CategoryBotton(textBotton:"sports",colorBotton:blue),
              //       CategoryBotton(textBotton:"sports",colorBotton:red),
              //
              //
              //     ],
              //   ),
              // ),            //
              //دي الحتة بتاعت ال choose category انا هنا شايلها وممكن احطها عادي
              Expanded(
                child: FutureBuilder(
                  future: api.fetchcategoryArticles(widget.Category),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return(snapshot.hasData)? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: white,
                          elevation: 5,
                          shadowColor: textColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          ('${snapshot.data[index].urlToImage}'=='null')? "assets/images/not found.png":'${snapshot.data[index].urlToImage}')),
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
                                  color: Colors.redAccent,
                                ),
                                height: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("${snapshot.data[index].title}",
                                  style: TextStyle(
                                      fontSize: fontSubTitel,
                                      color: textColor,
                                      fontWeight: FontWeight.w700

                                  ),
                                  textAlign: TextAlign.center,),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed:(){

                                  },
                                      icon:Icon(Icons.share_rounded)),
                                  IconButton(onPressed:(){},
                                      icon:Icon(Icons.copy_rounded)),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ):
                    Center(child: CircularProgressIndicator());
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
