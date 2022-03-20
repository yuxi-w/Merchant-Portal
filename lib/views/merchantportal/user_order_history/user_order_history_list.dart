import 'package:flutter/material.dart';
import 'package:merchant_app/datamodel/shoppingitem/ShoppingItem.dart';
import 'package:merchant_app/datamodel/userInfo/UserInfo.dart';
import 'package:merchant_app/views/order_history/order_history_list_item.dart';
import 'package:merchant_app/widgets/shopping_cart_list_view/shopping_cart_list_item.dart';

/// Shopping cart item list
class UserOrderHistoryListView extends StatefulWidget {
  final Future<List<UserInfo>> futureUserInfo;

  const UserOrderHistoryListView({Key? key, required this.futureUserInfo})
      : super(key: key);

  @override
  _UserOrderHistoryListViewState createState() =>
      _UserOrderHistoryListViewState();
}

class _UserOrderHistoryListViewState extends State<UserOrderHistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
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

          if (tempUserInfo.isNotEmpty) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: tempUserInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tempUserInfo[index].isBuyer!) ...[
                        Text(
                          "User " +
                              (tempUserInfo[index].id!).toString() +
                              ": " +
                              tempUserInfo[index].name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: 15),
                        if (tempUserInfo[index].orderHistory!.isNotEmpty) ...[
                          //             var orderHistoryList = [];
                          // for (var i = 0; i < userInfo.orderHistory!.length; i++) {
                          //   var userOrderHistory =
                          //       ShoppingItem.fromListJson(userInfo.orderHistory![i]);
                          //   orderHistoryList.add(userOrderHistory);
                          // }

                          ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount:
                                  tempUserInfo[index].orderHistory!.length,
                              itemBuilder: (BuildContext context, int index1) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order " + (index1 + 1).toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: ShoppingItem.fromListJson(
                                                tempUserInfo[index]
                                                    .orderHistory![index1])
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, ind) {
                                          return OrderHistoryListItem(
                                              ShoppingItem.fromListJson(
                                                  tempUserInfo[index]
                                                          .orderHistory![
                                                      index1])[ind]);
                                        }),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 20, 115, 10),
                                      child: calculateOrderTotal(
                                          ShoppingItem.fromListJson(
                                              tempUserInfo[index]
                                                  .orderHistory![index1])),
                                    ),
                                  ],
                                );
                              }),
                        ] else ...[
                          const Center(
                              child: Text(
                            "This user has not placed an order yet.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      ],
                      const SizedBox(height: 25),
                    ],
                  );
                });
          } else {
            return const Center(
                child: Text(
              "No User has placed an order yet!.",
              style: TextStyle(fontWeight: FontWeight.bold),
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
