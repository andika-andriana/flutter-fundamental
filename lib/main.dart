import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/product_cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductCartPageExample();
  }
}

class ProductCartPageExample extends StatelessWidget {
  const ProductCartPageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Product Card"),
          backgroundColor: primaryColor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Consumer<ProductState>(
            builder: (context, productState, child) => Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(20),
              child: ProductCart(
                imageUrl:
                    "https://fastly.picsum.photos/id/292/159/100.jpg?hmac=WjvnpzdmUDO40cmJwAqfsnZhYn6wBNwztULZKDgXJFg",
                name: "Bawang Bombai Enak - 1kg",
                price: "10.000",
                qty: productState.qty,
                onAddQty: () {
                  productState.qty++;
                },
                onRemoveQty: () {
                  productState.qty--;
                },
                onAddtoCart: () {},
                notification: (productState.qty > 5) ? "Diskon 10%" : "",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState extends ChangeNotifier {
  int _qty = 0;

  int get qty => _qty;
  set qty(int newQty) {
    if (newQty >= 0) {
      _qty = newQty;
      notifyListeners();
    }
  }
}
