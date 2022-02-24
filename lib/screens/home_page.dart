import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_bank/const/my_icons.dart';
import 'package:mobile_bank/const/size_config.dart';
import 'package:mobile_bank/widgets/my_card.dart';
import 'package:mobile_bank/widgets/my_debet_credit_item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int activeIndex = 0;
  int bottomNavBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildCompanyTitleSection(context),
            _buildScrollSection(),
            _buildWidgetsTitleSection(),
            _buildWidgetsSection(),
            _buildScrollTitleSection(),
            _buildDateForScrollSection(),
            _buildVerticalScroll()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildDateForScrollSection() {
    return Container(
            alignment: Alignment.center,
            child: Text(
              '14.02.2022г.',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: getUniqueW(16)),
            ),
            width: SizeConfig.screenWidth,
            height: getUniqueH(24),
            //  color: Color.fromARGB(255, 214, 212, 203),
          );
  }

  Widget _buildWidgetsTitleSection() {
    return Padding(
            padding:
                EdgeInsets.only(left: getUniqueW(16), top: getUniqueH(0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Быстрый доступ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: getUniqueW(16)),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      iconSize: getUniqueW(30),
      currentIndex: bottomNavBarIndex,
      onTap: (v)=> setState(() {
        bottomNavBarIndex = v;
      }),
       backgroundColor:  Colors.white,
      elevation: 0,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add_circled), label: ''),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_text), label: ''),
    ]);
  }

  Widget _buildVerticalScroll() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 600,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          separatorBuilder: (c, i) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return MyDebetCreditItemCard(index);
          }),
    );
  }

  Widget _buildScrollTitleSection() {
    return Padding(
      padding: EdgeInsets.only(left: getUniqueW(16), top: getUniqueH(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Лента событий',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: getUniqueW(16)),
          ),
          Row(
            children: [
              _buildChip(0, 'Все'),
              SizedBox(width: getUniqueW(8)),
              _buildChip(1, 'Поступления'),
              SizedBox(width: getUniqueW(8)),
              _buildChip(2, 'Списания'),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: RotatedBox(
                  child: SvgPicture.asset(
                    MyIcons.filter,
                    color: Colors.black,
                  ),
                  quarterTurns: -45,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(int index, String title) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          activeIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
          primary: index == activeIndex ? Colors.indigo : Colors.grey.shade200,
          padding: EdgeInsets.all(getUniqueW(8)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getUniqueW(16)))),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: index == activeIndex ? Colors.white : Colors.grey.shade600),
      ),
    );
  }

  Widget _buildWidgetsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getUniqueW(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                MyIcons.chart,
                color: Colors.black,
              ),
              width: (SizeConfig.screenWidth - getUniqueW(64)) / 3,
              height: getUniqueH(60),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(getUniqueW(16)),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(16),
              child: SvgPicture.asset(
                MyIcons.convert,
                color: Colors.black,
              ),
              width: (SizeConfig.screenWidth - getUniqueW(64)) / 3,
              height: getUniqueH(60),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 136, 23).withOpacity(0.2),
                borderRadius: BorderRadius.circular(getUniqueW(16)),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                MyIcons.wallet,
                color: Colors.black,
              ),
              width: (SizeConfig.screenWidth - getUniqueW(64)) / 3,
              height: getUniqueH(60),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 240, 113).withOpacity(0.2),
                borderRadius: BorderRadius.circular(getUniqueW(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollSection() {
    return Container(
      width: SizeConfig.screenWidth,
      height: getUniqueH(150),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: getUniqueW(8)),
        itemBuilder: (context, index) {
          return MyCard(index);
        },
      ),
    );
  }

  Widget _buildCompanyTitleSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getUniqueW(16)),
      child: Row(
        children: [
          Text(
            'OOO "DEVOPS"',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getUniqueH(14),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  padding: EdgeInsets.all(getUniqueW(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OOO "DEVOPS"',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getUniqueH(14),
                        ),
                      ),
                      Text(
                        'Company description',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getUniqueH(11),
                        ),
                      ),
                      Text(
                        'Company account number',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getUniqueH(11),
                        ),
                      ),
                    ],
                  ),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        getUniqueH(16),
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: SvgPicture.asset(
              MyIcons.arrow_down,
              color: Colors.black,
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: getUniqueW(8.0)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              MyIcons.more,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: getUniqueH(4)),
            height: getUniqueH(40),
            width: SizeConfig.screenWidth * 0.6,
            // color: Colors.grey,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
        ]),
      ),
    );
  }
}