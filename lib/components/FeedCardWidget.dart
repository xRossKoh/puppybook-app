import 'package:flutter/material.dart';

class FeedCardWidget extends StatelessWidget {
  const FeedCardWidget({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.food,
    @required this.age,
  }) : super(key: key);

  final String imgPath;
  final String name;
  final String food;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imgPath,
                  height: 120,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Call me:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Wub to eat:   ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "I am a big: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(food),
                      Text("$age years old!"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}