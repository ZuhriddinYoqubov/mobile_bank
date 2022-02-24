import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_bank/const/my_icons.dart';
import 'package:mobile_bank/const/size_config.dart';
import 'package:mobile_bank/widgets/glassmorphic_container.dart';

class MyCard extends StatelessWidget {
  int index;
  MyCard(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Общий баланс',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  print('button pressed');
                },
                icon:  SvgPicture.asset(MyIcons.more),
              )
            ],
          ),
          const Text(
            '1 000 000 000 000,00 Сум',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: getUniqueH(10)),
          Center(
            child: Column(
              children: [
                MyGlassmorphicContainer(
                    width: 100,
                    height: 25,
                    borderRadius: 20,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Выписки',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: getUniqueH(8),
                ),
                Container(
                  alignment: Alignment.center,
                  width: getUniqueW(70),
                  height: getUniqueW(10),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, i) => Container(
                      width: getUniqueW(10),
                      height: getUniqueH(10),
                      decoration: BoxDecoration(
                        color: index == i ? Colors.indigo : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    separatorBuilder: (context, sep) {
                      return SizedBox(
                        width: getUniqueW(10),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
          vertical: getUniqueH(8), horizontal: getUniqueW(16)),
      margin: EdgeInsets.all(getUniqueW(8)),
      width: SizeConfig.screenWidth - getUniqueW(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 50, 28, 245).withOpacity(0.6),
              Color.fromARGB(255, 245, 96, 141).withOpacity(0.4),
            ],
            stops: const [
              0.1,
              1,
            ]),
        //color: Colors.white,
        borderRadius: BorderRadius.circular(getUniqueW(16)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 4,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}