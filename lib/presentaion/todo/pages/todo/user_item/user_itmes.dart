import 'package:flutter/material.dart';
import '../../../../../core/unit/blocs/app/cubit.dart';

class UserItem extends StatelessWidget {
  final Map item;

  UserItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  if (item['isCompleted'] == 'false') {
                    AppBloc.get(context).updateCompleted(
                        completedStatus: 'true', id: item['id']);
                  } else if (item['isCompleted'] == 'true') {
                    AppBloc.get(context).updateCompleted(
                        completedStatus: 'false', id: item['id']);
                  }
                },
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: item['color'] == "Color(0XFFFF9D42)"
                          ? const Color(0XFFFF9D42)
                          : item["color"] == "Color(0XFFff5147)"
                              ? const Color(0XFFff5147)
                              : const Color(0XFF42a0ff),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: item['isCompleted'] == 'true'
                      ? Icon(
                          Icons.check,
                          color: item['color'] == "Color(0XFFFF9D42)"
                              ? const Color(0XFFFF9D42)
                              : item["color"] == "Color(0XFFff5147)"
                                  ? const Color(0XFFff5147)
                                  : const Color(0XFF42a0ff),
                          size: 20.0,
                        )
                      : Container(),
                )),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              '${item["title"]}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 25,
              child: IconButton(
                  onPressed: () {
                    AppBloc.get(context).deleteData(id: item['id']);
                  },
                  icon:  Icon(
                    Icons.delete,
                    size: 20,
                    color: item['color'] == "Color(0XFFFF9D42)"
                        ? const Color(0XFFFF9D42)
                        : item["color"] == "Color(0XFFff5147)"
                        ? const Color(0XFFff5147)
                        : const Color(0XFF42a0ff),
                  )),
            ),
            PopupMenuButton(
              icon: Icon(Icons.dehaze_rounded,color: item['color'] == "Color(0XFFFF9D42)"
                  ? const Color(0XFFFF9D42)
                  : item["color"] == "Color(0XFFff5147)"
                  ? const Color(0XFFff5147)
                  : const Color(0XFF42a0ff),
              ),


                onSelected: (value) {

                  if (value == 0) {
                    AppBloc.get(context).updateCompleted(
                        completedStatus: 'true', id: item['id']);
                  } else if (value == 1) {
                    AppBloc.get(context).updateCompleted(
                        completedStatus: 'false', id: item['id']);
                  } else {
                    AppBloc.get(context)
                        .updateFavorite(favoriteStatus: 'true', id: item['id']);
                  }
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(

                        child: Text("Add to completed"),
                        value: 0,
                      ),
                      const PopupMenuItem(
                        child: Text("Add to uncompleted"),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("Add to favorite"),
                        value: 2,
                      ),
                    ]),
          ],
        ),
      ),


    );
    //   Container(
    //   height: 80,
    //   width: double.infinity,
    //   clipBehavior: Clip.antiAliasWithSaveLayer,
    //   decoration: BoxDecoration(
    //     color: item['color'] == "Color(0XFFFF9D42)"
    //         ? Color(0XFFFF9D42)
    //         : item["color"] == "Color(0XFFff5147)"
    //             ? Color(0XFFff5147)
    //             : Color(0XFF42a0ff),
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 20),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: 50,
    //           width: 30,
    //           child: IconButton(onPressed: ()
    //           {
    //             if( item['favorite']== 'true') {
    //               AppBloc.get(context).updateFavorite(favoriteStatus: 'false', id: item['id']);
    //
    //             }else if (item['favorite']== 'false'){
    //               AppBloc.get(context).updateFavorite(favoriteStatus: 'true', id: item['id']);
    //             }
    //
    //           },
    //               icon: item['favorite']=='true'? Icon(Icons.favorite,size: 20):Icon(Icons.favorite_border,size: 20)
    //            // iconSize: 10,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 50,
    //           width: 30,
    //           child: IconButton(onPressed: ()
    //           {
    //             if( item['isCompleted']== 'false') {
    //               AppBloc.get(context).updateCompleted(completedStatus: 'true', id: item['id']);
    //
    //             }else if (item['isCompleted']== 'true'){
    //               AppBloc.get(context).updateCompleted(completedStatus: 'false', id: item['id']);
    //             }
    //           }, icon: item['isCompleted']=='true'? Icon(Icons.download_done_outlined,size: 20)
    //                 :Icon(Icons.done_outline,size: 20)
    //
    //         ),
    //         ),
    //         const SizedBox(
    //           width: 10,
    //         ),
    //         Expanded(
    //           flex: 2,
    //           child: Text(
    //             '${item["title"]}',overflow: TextOverflow.ellipsis,maxLines: 2,
    //
    //             style: const TextStyle(
    //                 color: Colors.white, fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         Spacer(),
    //         SizedBox(
    //           height: 50,
    //           width: 25,
    //           child: IconButton(onPressed: ()
    //           {
    //             AppBloc.get(context).deleteData(id: item['id']);
    //           }, icon: Icon(Icons.delete,size: 20,)),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(right: 8.0),
    //           child: PopupMenuButton(
    //               onSelected: (value) {
    //                 if (value == 0) {
    //                   AppBloc.get(context)
    //                       .updateCompleted(completedStatus: 'true', id: item['id']);
    //                 } else if (value == 1) {
    //                   AppBloc.get(context)
    //                       .updateCompleted(completedStatus: 'false', id: item['id']);
    //                 } else {
    //                   AppBloc.get(context)
    //                       .updateFavorite(favoriteStatus: 'true', id: item['id']);
    //                 }
    //               },
    //               itemBuilder: (context) => [
    //                     const PopupMenuItem(
    //                       child: Text("Add to completed"),
    //                       value: 0,
    //                     ),
    //                     const PopupMenuItem(
    //                       child: Text("Add to uncompleted"),
    //                       value: 1,
    //                     ),
    //                     const PopupMenuItem(
    //                       child: Text("Add to favorite"),
    //                       value: 2,
    //                     ),
    //                   ]),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
