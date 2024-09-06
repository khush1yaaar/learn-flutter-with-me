import 'package:flutter/material.dart';
import 'package:socials/ResponsiveLayout/layout_one_helper.dart';

// ----------------------------------- ANOTHER WAY OF IMPLEMENTING RESPOSIVE LAYOUT WITH THE HELPER SCREEN WIDGET ------------------------------------
class LayoutOne extends StatefulWidget {
  const LayoutOne({super.key});

  @override
  State<LayoutOne> createState() => _LayoutOneState();
}

class _LayoutOneState extends State<LayoutOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutOneHelper(
            mobile: buildMobileLayout(), laptop: buildLaptopLayout()),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.blue.shade800,
          height: 100,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('kjshfkj kjashfkjsdhf kjfhkjsdhfuiuf fniuefhiurf anfieraif jdfhie jahsdfe kjiai khdjfaoie aksdjfi lakjeir jsklfji'),
      ],
    );
  }
  Widget buildLaptopLayout() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          color: Colors.blue.shade800,
          height: 100,
          width: 200,
        ),
        const SizedBox(
          width: 20,
        ),
        const Text('kjshfkj kjashfkjsdhf kjfhkjsdhfuiuf fniuefhiurf anfieraif jdfhie jahsdfe kjiai khdjfaoie aksdjfi lakjeir jsklfji'),
      ],
    );
  }
}











//---------------------------------- one way of implement resposive layout ------------------------------------------

// import 'package:flutter/material.dart';

// class LayoutOne extends StatefulWidget {
//   const LayoutOne({super.key});

//   @override
//   State<LayoutOne> createState() => _LayoutOneState();
// }

// class _LayoutOneState extends State<LayoutOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade800,
//         title: const Text('Responsive Layout - 1'),
//       ),
//       body: SafeArea(
//         child: LayoutBuilder(builder: (context, constraints) {
//           if (constraints.maxWidth < 768) {
//             return Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 buildContainer(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 buildText(),
//               ],
//             );
//           }
//           else {
//             return Row(
//               children: [
//                 const SizedBox(width: 20,),
//                 buildContainer(),
//                 const SizedBox(width: 20,),
//                 Expanded(
//                   child: buildText(),
//                 )
//               ],
//             );
//           }
//         }),
//       ),
//     );
//   }

//   Container buildContainer() {
//     return Container(
//                 height: 100,
//                 width: 200,
//                 color: Colors.blue.shade800,
//               );
//   }

//   Text buildText() {
//     return Text(
//                   'sdhflk ksjdfklash ksdfashdfo hnfhiokaf iohfoskfn oifoirhf hdfaif hifhkf 9ufijf a;jfirefih ifiehr hfehiorh ehfnurfhisfhr8'
//                 );
//   }
// }
