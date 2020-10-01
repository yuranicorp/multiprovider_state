import 'package:flutter/material.dart';
import 'package:multi_provider/core/viewmodels/cart.dart';
import 'package:multi_provider/core/viewmodels/money.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButton(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Multi Provider"),
      ),
      body: HomeBody()
    );
  }

  Widget _floatingButton() {
    return Consumer2<Money, Cart>(
      builder: (context, money, cart, _) {

        return FloatingActionButton(
          onPressed: () {
            if (money.balance >= cart.applePrice) {
              cart.addQuantity(1);
              money.decreaseBalance(cart.applePrice);
            }
          },
          child: Icon(Icons.add_shopping_cart),
          backgroundColor: Colors.purple,
        );
      }
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _balanceField(),
          _resultWidget()
        ],
      ),
    );
  }

  Widget _balanceField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Balance"),
        Container(
          child: Align(
            alignment: Alignment.centerRight,
            child: Consumer<Money>(
              builder: (context, money, _) => Text(
                money.balance.toString(),
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          width: 150,
          height: 30,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.purple[100],
            border: Border.all(
              color: Colors.purple,
              width: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _resultWidget() {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: Consumer<Cart>(
          builder: (context, cart, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Apple(${cart.applePrice}) x " + cart.quantity.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                (cart.applePrice * cart.quantity).toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
    );
  }
}