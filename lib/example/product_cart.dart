import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 232, 94, 20);
const Color secondaryColor = Color.fromARGB(255, 21, 157, 0);

class ProductCart extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final TextStyle textStyle = const TextStyle(
    fontFamily: "Poppins",
    fontSize: 12,
    color: Colors.black87,
    fontWeight: FontWeight.w600,
  );
  final int qty;
  final Function onAddtoCart;
  final Function onAddQty;
  final Function onRemoveQty;
  final String notification;

  const ProductCart({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.qty,
    required this.onAddtoCart,
    required this.onAddQty,
    required this.onRemoveQty,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 130,
          height: (notification != "") ? 270 : 250,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != "") ? notification : "",
              style: textStyle.copyWith(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(1, 1))
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      name,
                      style: textStyle,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      "Rp $price",
                      style:
                          textStyle.copyWith(fontSize: 10, color: primaryColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      width: 140,
                      height: 30,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onAddQty();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              color: primaryColor,
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          Text(qty.toString()),
                          GestureDetector(
                            onTap: () {
                              onRemoveQty();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              color: primaryColor,
                              child:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        onAddtoCart();
                      },
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          primaryColor,
                        ),
                      ),
                      child: const Icon(Icons.add_shopping_cart),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
