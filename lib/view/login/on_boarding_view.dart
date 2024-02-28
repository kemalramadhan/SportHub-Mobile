import 'package:flutter/material.dart';
import 'package:sporthub/common/color_extension.dart';
import 'package:sporthub/common/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int selectPage = 0;
  List pageArr = [
    {
      "title": "SportHub",
      "subtitle": "Exercise anytime, \nanywhere.",
      "image": "assets/img/icon push up.png"
    },
    {
      "title": "SportHub",
      "subtitle": "Build your own routine workout, just at home.",
      "image": "assets/img/icon senam.png"
    },
    {
      "title": "SportHub",
      "subtitle": "Stay fit with Us!",
      "image": "assets/img/icon sit up.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.periwinkle,
      body: Stack(
        children: [
          Image.asset(
            "assets/img/on_boarding_view.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),

          // bikin tampilan
          SafeArea(
            child: PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 40,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    pObj["image"].toString(),
                    width: media.width * 0.7,
                    height: media.width * 0.7,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ]);
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((pObj) {
                    var index = pageArr.indexOf(pObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: selectPage == index
                              ? TColor.white
                              : TColor.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(6)),
                    );
                  }).toList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: RoundButton(
                    title: "Start",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: media.width * 0.07,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
