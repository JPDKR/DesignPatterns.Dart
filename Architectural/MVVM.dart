// NOTA: ESTE PATRON SOLO FUNCIONA CON FLUTTER

// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// // Model
// class Product {
//   int id;
//   String? name;
//   double price;

//   Product({required this.id, this.name, required this.price});
// }

// // ViewModel
// class ProductViewModel extends ChangeNotifier {
//   Product _product;

//   ProductViewModel(this._product);

//   String? get name => _product.name;
//   set name(String? value) {
//     if (_product.name != value) {
//       _product.name = value;
//       notifyListeners();
//     }
//   }

//   double get price => _product.price;
//   set price(double value) {
//     if (_product.price != value) {
//       _product.price = value;
//       notifyListeners();
//     }
//   }
// }

// // View (Flutter example)
// class ProductView extends StatelessWidget {
//   final ProductViewModel viewModel;

//   ProductView({required this.viewModel});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ProductViewModel>(
//       create: (_) => viewModel,
//       child: Consumer<ProductViewModel>(
//         builder: (context, viewModel, child) {
//           return Column(
//             children: [
//               TextField(
//                 onChanged: (value) => viewModel.name = value,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 controller: TextEditingController(text: viewModel.name),
//               ),
//               TextField(
//                 onChanged: (value) => viewModel.price = double.tryParse(value) ?? viewModel.price,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 controller: TextEditingController(text: viewModel.price.toString()),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }