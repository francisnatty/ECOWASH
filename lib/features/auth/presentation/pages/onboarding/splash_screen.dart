// import 'package:flutter/material.dart';

// import '../../../../../core/utils/utils.dart';

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Custom background shape
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: ClipPath(
//               clipper: CustomShapeClipper(),
//               child: Container(
//                 height: 300,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         AppImages.pressingIron), // Replace with your image path
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Content on top of the background
//           const Positioned(
//             top: 80,
//             left: 20,
//             right: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Fill your information below or register\nwith your social accounts.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurvedBackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.green.shade700 // Replace with your preferred color
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0); // Start at the top-left corner
//     path.lineTo(0, size.height * 0.7); // Move down
//     path.quadraticBezierTo(
//       size.width * 0.5, size.height, // Control point
//       size.width, size.height * 0.7, // End point
//     );
//     path.lineTo(size.width, 0); // Top-right corner
//     path.close(); // Complete the path

//     canvas.drawPath(path, paint);

//     // Overlay a background image
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final imagePaint = Paint()
//       ..shader = ImageShader(
//         AssetImage('assets/images/background.jpg').assetName
//         TileMode.clamp,
//         TileMode.clamp,
//         Matrix4.identity().storage,
//       );
//     canvas.drawRect(rect, imagePaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }