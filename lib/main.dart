import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/product_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListViewBuilderWithBlocExamplePage();
  }
}

class ListViewBuilderWithBlocExamplePage extends StatelessWidget {
  const ListViewBuilderWithBlocExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: ListViewBuilderWithBlocExample(),
    );
  }
}

class ListViewBuilderWithBlocExample extends StatelessWidget {
  ListViewBuilderWithBlocExample({super.key});
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List View Builder With Bloc Example"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<ProductBloc>()
                      .add(AddProduct(random.nextInt(4) + 1));
                },
                child: const Text("Add List"),
              ),
            ),
            BlocBuilder<ProductBloc, List<Product>>(builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (index == 0) ? const SizedBox(width: 16) : Container(),
                        ProductCart(
                          imageUrl: state[index].imageUrl,
                          name: state[index].name,
                          price: state[index].price.toString(),
                          qty: random.nextInt(10),
                          onAddtoCart: () {},
                          onAddQty: () {},
                          onRemoveQty: () {},
                          notification: "",
                        ),
                        const SizedBox(width: 16)
                      ],
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class Product {
  String imageUrl, name;
  int price;

  Product({this.imageUrl = "", this.name = "", this.price = 0});
}

abstract class ProductEvent {}

class AddProduct extends ProductEvent {
  int total;
  AddProduct(this.total);
}

class ProductBloc extends Bloc<ProductEvent, List<Product>> {
  ProductBloc() : super([]) {
    on<AddProduct>((event, emit) {
      List<Product> products = [];
      for (var i = 0; i < event.total; i++) {
        products.add(
          Product(
              imageUrl:
                  "https://fastly.picsum.photos/id/292/159/100.jpg?hmac=WjvnpzdmUDO40cmJwAqfsnZhYn6wBNwztULZKDgXJFg",
              name: "Product ${i + 1}",
              price: (i + 1) * 5000),
        );
      }
      emit(products);
    });
  }
}
