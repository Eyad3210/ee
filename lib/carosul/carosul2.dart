import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carosul2 extends StatelessWidget {
  const Carosul2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
            enableInfiniteScroll: false,
            autoPlay: true,
            initialPage: 0,
            height: 200,
            enlargeCenterPage: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            // scrollDirection: Axis.horizontal,

            viewportFraction: 0.88),
        items: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assest/images/corona.jpg'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assest/images/corona2.jfif'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assest/images/corona3.jfif'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assest/images/corona4.jpg'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assest/images/corona5.jfif'),
          ),
        ],
      ),
    );

    /*  Container(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIdx) {
          return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(images[index]));
        },
        options: CarouselOptions(
            autoPlay: true,
            height: 100,
            enableInfiniteScroll: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(
              milliseconds: 800,
            )),
      ),
    ); */
  }
}
