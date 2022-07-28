import 'package:flutter/material.dart';

class CalenderItem extends StatelessWidget {
  final Map item;
  const CalenderItem({Key? key,required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 80,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color:
            item['color']== "Color(0XFFFF9D42)" ? Color(0XFFFF9D42) :item['color'] == "Color(0XFFff5147)" ? Color(0XFFff5147) :Color(0XFF42a0ff)  ,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      '${item['start']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${item['title']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Checkbox(
                  value: false,
                  onChanged: (value){},

                  )

            ],
          ),
        );


  }
}
