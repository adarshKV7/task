// // ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:may_model_exam/controller/product_screen_controller.dart';
// import 'package:provider/provider.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   void initState() {
//     context.read<ProductScreenController>().convertedData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productScreen = context.watch<ProductScreenController>();
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: productScreen.zippoModel?.postCode?.length,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 200,
//                   color: Colors.red,
//                   child: Column(
//                     children: [Text()],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:may_model_exam/controller/product_screen_controller.dart';
import 'package:may_model_exam/view/next_screen/next_screen.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductScreenController>().convertedData();
  }

  @override
  Widget build(BuildContext context) {
    final productScreen = context.watch<ProductScreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextScreen(),
              ));
        },
        child: Icon(Icons.arrow_right_alt),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productScreen.zippoModel?.places?.length ?? 0,
              itemBuilder: (context, index) {
                final place = productScreen.zippoModel!.places![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Place Name: ${place.placeName}"),
                        Text("Longitude: ${place.longitude}"),
                        Text("State: ${place.state}"),
                        Text("State Abbreviation: ${place.stateAbbreviation}"),
                        Text("Latitude: ${place.latitude}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
