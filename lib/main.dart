import 'package:flutter/material.dart';
import 'package:flutter_application_1/balance_state.dart';
import 'package:flutter_application_1/quantity_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MultiProviderStateManagementExample(),
    );
  }
}

class MultiProviderStateManagementExample extends StatelessWidget {
  const MultiProviderStateManagementExample({super.key});
  final price = 10000;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<QuantityProvider>(
            create: (context) => QuantityProvider(),
          ),
          ChangeNotifierProvider<BalanceProvider>(
            create: (context) => BalanceProvider(),
          ),
        ],
        child: Scaffold(
          persistentFooterButtons: [
            Consumer<QuantityProvider>(
              builder: (context, provQuantity, child) =>
                  Consumer<BalanceProvider>(
                builder: (context, provBalance, child) => ElevatedButton(
                  onPressed: () {
                    if (provQuantity.quantity >= 0) {
                      provBalance.balance += price;
                      provQuantity.quantity -= 1;
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: 100,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Consumer<QuantityProvider>(
                builder: (context, value, child) => Text(
                  value.quantity.toString(),
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Consumer<QuantityProvider>(
              builder: (context, provQuantity, child) =>
                  Consumer<BalanceProvider>(
                builder: (context, provBalance, child) => ElevatedButton(
                  onPressed: () {
                    if (provBalance.balance > 0) {
                      provQuantity.quantity += 1;
                      provBalance.balance -= price;
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
          appBar: AppBar(
            title: const Text("Multi Provider State Management Example"),
          ),
          body: SafeArea(
            bottom: true,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://picsum.photos/id/0/300/300"),
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "Macbook Pro M2",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    "Our Price Rp. 10.000, -",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Balance",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[800],
                              ),
                            ),
                            Consumer<BalanceProvider>(
                              builder: (context, value, child) => Text(
                                value.balance.toString(),
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Quantity",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[800],
                              ),
                            ),
                            Consumer<QuantityProvider>(
                              builder: (context, value, child) => Text(
                                value.quantity.toString(),
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[800],
                              ),
                            ),
                            Consumer<QuantityProvider>(
                              builder: (context, quantity, child) => Text(
                                (quantity.quantity * price).toString(),
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
