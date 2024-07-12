// Padding(
//   padding: const EdgeInsets.all(35),
//   child: Column(
//     children: [
//       Container(
//         color: Colors.black,
//         height: 200,
//         width: double.infinity,
//         child: Stack(
//           fit: StackFit.expand, // Ensures the Stack fills the Container
//           children: [
//             Image(
//               fit: BoxFit.fill, // Ensures the image fills the Stack
//               image: AssetImage('assets/images/card.png'),
//             ),
//             Positioned(
//               left: MediaQuery.of(context).size.width * 0.35, // Position text based on screen width
//               top: MediaQuery.of(context).size.height * 0.2, // Position text based on screen height
//               child: Text(
//                 cardController.text.toString(),
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// );
