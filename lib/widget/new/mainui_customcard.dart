import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  double _width;
  double _height;
  double _aspectRatio;
  String title;
  String price;
  String dateAdded;
  String category;
  String description;
  String image;
  String location;



  CustomCard({this.title, this.price, this.dateAdded, this.category,
      this.description, this.image, this.location});

  @override
  Widget build(BuildContext context) {
    _width= MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 1,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: _width/2.5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(2),
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: _height,
                width: _width,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height/40),
                ),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: Container(
                      width: _width / 2.5,
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: _height/70,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    width: _width / 2.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           /* Text(
                              dateAdded,
                              style: TextStyle(fontSize: _height/65),
                            ),*/
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: _height/65,
                                ),
                                Text(
                                  location,
                                  style: TextStyle(fontSize: _height/65),
                                )
                              ],
                            ),
                          ],
                        ),
                       /* Flexible(
                          child:  GestureDetector(
                            child: Icon(Icons.favorite_border, size: _height/30,),
                            onTap: (){
                              print('Fav');
                            },
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
