import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/views/order_history/order_history_list_item.dart';

/// Shopping cart item list
class OrderHistoryListView extends StatefulWidget {
  final Future<List<UserInfo>> futureUserInfo;

  const OrderHistoryListView({Key? key, required this.futureUserInfo})
      : super(key: key);

  @override
  _OrderHistoryListViewState createState() => _OrderHistoryListViewState();
}

class _OrderHistoryListViewState extends State<OrderHistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
            const BoxConstraints(minHeight: 450, minWidth: 300, maxWidth: 1000),
        margin: const EdgeInsets.fromLTRB(70, 16, 70, 16),
        child: buildFutureBuilder());
  }

  FutureBuilder<List<UserInfo>> buildFutureBuilder() {
    return FutureBuilder(
      future: widget.futureUserInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("snapData ${snapshot.data}");
          var tempUserInfo = snapshot.data as List<UserInfo>;
          var userInfo = tempUserInfo[0];
          if (userInfo.orderHistory!.isNotEmpty) {
            var orderHistoryList = [];
            for (var i = 0; i < userInfo.orderHistory!.length; i++) {
              var userOrderHistory =
                  ShoppingItem.fromListJson(userInfo.orderHistory![i]);
              orderHistoryList.add(userOrderHistory);
            }

            // return ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: orderHistoryList.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ShopCartListItem((orderHistoryList)[index]);
            //   },
            // );
            return ListView.builder(
              shrinkWrap: true,
              itemCount: orderHistoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Number: " + (index + 1).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: orderHistoryList[index].length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int ind) {
                        return OrderHistoryListItem(
                            (orderHistoryList)[index][ind]);
                      },
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.fromLTRB(10, 20, 115, 10),
                      child: calculateOrderTotal(orderHistoryList[index]),
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            );
          } else {
            return const Center(
                child: Text(
              "You have not placed any orders.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ));
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed To Load Data'));
        } else {
          return const SizedBox(
              height: 500, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Text calculateOrderTotal(List<ShoppingItem> orderHistoryList) {
    int price = 0;
    orderHistoryList.forEach((element) {
      price += int.parse(element.price!);
    });
    return Text(
      "Order Total: " + price.toString(),
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
