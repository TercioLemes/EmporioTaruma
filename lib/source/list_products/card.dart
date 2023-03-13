import 'package:emporio_taruma/source/utils/color.dart';
import 'package:emporio_taruma/source/utils/size.dart';
import 'package:flutter/material.dart';

enum BalanceType {
  unit,
  kilo,
}

class Balance {
  String balance;
  BalanceType type;

  Balance({
    required this.balance,
    required this.type,
  });
}

const double borderSideSize = 0.5;
const double cardWidth = 150;
const double cardHeight = 224;

class CardWidget extends StatelessWidget {
  final String title;
  final String image;
  final Balance? balance;
  final List<String>? icon;

  const CardWidget({
    Key? key,
    required this.title,
    required this.image,
    this.balance,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.sizeXL),
          side: const BorderSide(
            color: CustomColors.grey,
            width: borderSideSize,
          ),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(DesignTokens.sizeXL),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Image(image: image),
                    if (balance != null)
                      Positioned(
                        bottom: DesignTokens.sizeSM,
                        child: BalanceIndicator(balance: balance),
                      ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: DesignTokens.sizeS),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.sizeS),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: icon != null ? 2 : 3,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignTokens.sizeSM),
                    icon != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: DesignTokens.sizeSM),
                            child: SizedBox(
                              height: DesignTokens.sizeXXL,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  IconBuilder(),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(DesignTokens.sizeXL),
        topRight: Radius.circular(DesignTokens.sizeXL),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(DesignTokens.sizeXL),
            topRight: Radius.circular(DesignTokens.sizeXL),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}

class BalanceIndicator extends StatelessWidget {
  const BalanceIndicator({
    Key? key,
    required this.balance,
  }) : super(key: key);

  final Balance? balance;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.green,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(DesignTokens.sizeS),
        bottomLeft: Radius.circular(DesignTokens.sizeS),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: DesignTokens.sizeSM,
          top: DesignTokens.sizeXS,
          bottom: DesignTokens.sizeXS,
          right: DesignTokens.sizeXS,
        ),
        child: Text(
          _formattedBalance(balance!),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: DesignTokens.fontSM,
          ),
        ),
      ),
    );
  }
}

class IconBuilder extends StatelessWidget {
  const IconBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, count) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: DesignTokens.sizeXS),
          child: Icon(
            Icons.energy_savings_leaf_outlined,
            color: CustomColors.greenTaruma,
          ),
        );
      },
    );
  }
}

String _formattedBalance(Balance balance) {
  final String type = balance.type == BalanceType.unit ? 'Un' : 'Kg';
  String amount = (double.parse(balance.balance) / 100.0)
      .toStringAsPrecision(balance.balance.length);
  amount = amount.replaceAll('.', ',');
  return 'R\$ $amount /$type';
}
