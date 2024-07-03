import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socials/main.dart';


//----------------------------- WITH PROVIDER---------------------------
class RiverpodScreen extends StatefulWidget {
  const RiverpodScreen({super.key});

  @override
  State<RiverpodScreen> createState() => _RiverpodScreenState();
}
// class _RiverpodScreenState extends State<RiverpodScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer(
//           builder: (context,ref,child) {
//             final number = ref.watch(numberProvider);
//             return Text(number.toString());
//           }
//         ),
//       ),
//     );
//   }
// }


//-----------------------------WITH CONSUMER WIDGET-------------------------
// class RiverpodScreen extends ConsumerWidget {
//   const RiverpodScreen ({super.key});

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final number = watch(numberProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(number.toString()),
//       ),
//     );
//   }
// }


//------------------------------STATE PROVIDER---------------------------------
// class _RiverpodScreenState extends State<RiverpodScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer(
//           builder: (context, ref, child) {
//             // Watch the numberStateProvider to get the current value
//             final numberState = ref.watch(numberStateProvider);
//             return Text(numberState.toString(),style: TextStyle(fontSize: 100),);
//           },
//         ),
//       ),
//       floatingActionButton: Consumer(
//         builder: (context, ref, child) {
//           return FloatingActionButton(
//             onPressed: () {
//               increment(ref); // Pass ref to the increment function
//             },
//             child: Icon(Icons.add), // Add an icon for the button
//           );
//         },
//       ),
//     );
//   }
//   void increment(WidgetRef ref) {
//     // Use ref.read to access and update the state
//     ref.read(numberStateProvider.notifier).state++;
//   }
// }


//-------------------------------STATE NOTIFIER PROVIDER---------------------------------

class _RiverpodScreenState extends State<RiverpodScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            // Watch the numberStateProvider to get the current value
            final numbersNotifierState = ref.watch(numberNotifierProvider);
            return ListView.builder(
              itemBuilder: (context,index) {
                return Text(numbersNotifierState[index].toString());
              },
              itemCount: numbersNotifierState.length,
            );
          },
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              //increment(ref); // Pass ref to the increment function
              ref.read(numberNotifierProvider.notifier).add(5);
            },
            child: Icon(Icons.add), // Add an icon for the button
          );
        },
      ),
      
    );
  }
  void increment(WidgetRef ref) {
    // Use ref.read to access and update the state
    ref.read(numberStateProvider.notifier).state++;
  }
}
