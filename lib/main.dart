// ignore_for_file: prefer_typing_uninitialized_variables

// This app requires flutter's svg library
// to load svg icons into the Flutter App
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppUI',
      home: FrontPage(),
    );
  }
}

// Front Page that will be visible on the screen
class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TopBanner(),
              SizedBox(height: 10),
              OptionsWidgets(
                  iconImage: "assets/icons/clock-solid.svg",
                  iconColor: Colors.red,
                  iconBackground: Color.fromARGB(255, 255, 209, 209),
                  textTitle: "Clocking",
                  textdescription: "Keep track of your Working Hours"),
              OptionsWidgets(
                  iconImage: "assets/icons/calendar-days-solid.svg",
                  textTitle: "Shifts",
                  textdescription: "Accept and reject your shifts",
                  iconColor: Color.fromARGB(255, 43, 43, 43),
                  iconBackground: Color.fromARGB(255, 212, 212, 212)),
              OptionsWidgets(
                  iconImage: "assets/icons/file-signature-solid.svg",
                  textTitle: "Contract details",
                  textdescription: "Review & Download your contracts",
                  iconColor: Colors.blue,
                  iconBackground: Color.fromARGB(255, 207, 233, 255)),
              OptionsWidgets(
                  iconImage: "assets/icons/money-check-solid.svg",
                  textTitle: "Payslips",
                  textdescription: "Access all your payslips",
                  iconColor: Color.fromARGB(255, 53, 122, 56),
                  iconBackground: Color.fromARGB(255, 151, 229, 153)),
              OptionsWidgets(
                  iconImage: "assets/icons/file-lines-solid.svg",
                  textTitle: "Other documents",
                  textdescription: "Find your past jobs documents",
                  iconColor: Colors.purple,
                  iconBackground: Color.fromARGB(255, 244, 185, 255)),
              OptionsWidgets(
                  iconImage: "assets/icons/clipboard-list-solid.svg",
                  textTitle: "Report an issue",
                  textdescription: 'Let us know if you encounter an issue',
                  iconColor: Color.fromARGB(255, 206, 185, 0),
                  iconBackground: Color.fromARGB(255, 255, 255, 159))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Oppurtunities",
            icon: Icon(Icons.check_box_rounded),
          ),
          BottomNavigationBarItem(
            label: "Messages",
            icon: Icon(Icons.message_rounded),
          ),
          BottomNavigationBarItem(
            label: "Mails",
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.account_circle),
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Widget for the Banner at the top of the screen
class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: 200,
        width: width - 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 70, 196, 255),
                  Color.fromARGB(209, 4, 73, 211)
                ])),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 25.0, left: 20, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "YOUR CURRENT WORK",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "Van Driver",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "AT AMAZON",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TopBannerTexts(topText: "Total Earnings", cost: "12,290"),
                  TopBannerTexts(topText: "Last Month", cost: "1,345"),
                ],
              )
            ],
          ),
        ));
  }
}

// Top Banner has text
// TopBannerText shows the text on the banner

// This takes parameter TopText and cost
class TopBannerTexts extends StatelessWidget {
  final topText;
  final cost;
  const TopBannerTexts({super.key, required this.topText, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Text(
              cost,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "GBP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}

// OptionWidgets is a container that shows different
// options available in the app like Clocking, Shifts etc

// This requires constructors which take parameters like iconcolor,
// icon Image, Background of Icon, Title Text, and Text Desc.
class OptionsWidgets extends StatelessWidget {
  final iconImage;
  final iconColor;
  final iconBackground;
  final textTitle;
  final textdescription;
  const OptionsWidgets({
    super.key,
    required this.iconImage,
    required this.textTitle,
    required this.textdescription,
    required this.iconColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(width: 0.8, color: Colors.grey)),
      ),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: iconBackground,
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  iconImage,
                  width: 18.0,
                  height: 18.0,
                  color: iconColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    textdescription,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_right,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
