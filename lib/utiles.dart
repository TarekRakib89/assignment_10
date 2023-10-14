// import 'package:assignment_10/edit_item.dart';
// import 'package:assignment_10/todomodel.dart';

// import 'package:flutter/material.dart';

// void showDialogBox(BuildContext context, int index, Todo todo) {
//   showDialog<String>(
//     context: context,
//     builder: (BuildContext context) => AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       title: const Text(
//         'Alert',
//         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//       ),
//       content: const SizedBox(
//         height: 10,
//       ),
//       actions: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return EditItem(
//                         todoitem: todo,
//                         addUpdate: (Todo todoupdate) {},
//                       );
//                     });
//               },
//               child: const Text(
//                 'Edit',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 'Delete',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
