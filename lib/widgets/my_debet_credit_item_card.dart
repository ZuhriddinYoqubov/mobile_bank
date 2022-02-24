import 'package:flutter/material.dart';
import 'package:mobile_bank/const/size_config.dart';

class MyDebetCreditItemCard extends StatelessWidget {
  int index;
   MyDebetCreditItemCard(
    this.index,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: getUniqueW(16)),
      width: SizeConfig.screenWidth,
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: SizeConfig.screenWidth * 0.14,
            child: Icon(
              index % 2 == 0
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: index % 2 == 0 ? Colors.red : Colors.green,
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contragent name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: getUniqueW(16),
                  ),
                ),
                SizedBox(height: getUniqueH(4)),
                Text(
                  'Description text, lorem impsum data',
                  style: TextStyle(
                      fontSize: getUniqueW(14),
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  index % 2 == 0
                      ? "-5 000 000,00 Сум"
                      : '+50 000 000,00 Сум',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: getUniqueW(16),
                      color: index % 2 == 0
                          ? Colors.black
                          : Colors.green),
                ),
                SizedBox(height: getUniqueH(4)),
                Text(
                  '09:45',
                  style: TextStyle(
                    fontSize: getUniqueW(14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}