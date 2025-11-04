import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/view/cardetail/views/car_detail_customize_campaign.dart';
import 'package:lcv_ui_demo/widgets/app_button.dart';
import 'package:lcv_ui_demo/widgets/header/home_header_view.dart';

class CarDetailCustomizeScreen extends StatefulWidget {
  const CarDetailCustomizeScreen({super.key});

  @override
  State<CarDetailCustomizeScreen> createState() =>
      _CarDetailCustomizeScreenState();
}

class _CarDetailCustomizeScreenState extends State<CarDetailCustomizeScreen> {
  int bodyIndex = 0;
  int themeIndex = 0;
  List<AssetGenImage> bodyImages = [
    Assets.icons.car.icCarRed,
    Assets.icons.car.icCarBlue,
    Assets.icons.car.icCarWhite,
    Assets.icons.car.icCarSilver,
    Assets.icons.car.icCarBlack,
    Assets.icons.car.icCarGray,
  ];
  List<AssetGenImage> themeImages = [
    Assets.icons.car.icCarBgRed,
    Assets.icons.car.icCarBgPeru,
    Assets.icons.car.icCarBgCadetblue,
    Assets.icons.car.icCarBgLightsteelblue,
    Assets.icons.car.icCarBgGreen,
    Assets.icons.car.icCarBgDimgray,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _backgroundCar(),
          _themeCar(),
          _car(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: HomeHeaderView(title: "Customize display"),
              ),
              SizedBox(height: 180),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        _bodyColor(),
                        SizedBox(height: 16),
                        _cabColor(),
                        SizedBox(height: 16),
                        _themeColor(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: _applyButton(),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyColor() {
    final items = [
      CarCustomize(name: "Namibu Mica Orange", color: "#8A2D31"),
      CarCustomize(name: "Biarritz Met Blue", color: "#154888"),
      CarCustomize(name: "Splash White", color: "#D0CCC9"),
      CarCustomize(name: "Mercury Met Silver", color: "#9B9B9B"),
      CarCustomize(name: "Onyx Mica Black", color: "#2B2B2B"),
      CarCustomize(name: "Obsidian Mica Gray", color: "#AEB1B6"),
    ];
    return CarDetailCustomizeCampaign(
      typer: CarCustomizeCampaign.body,
      items: items,
      selected: (int value) {
        setState(() {
          bodyIndex = value;
        });
      },
    );
  }

  Widget _themeColor() {
    final items = [
      CarCustomize(name: "Bordeaux Mica Red", color: "#BA3A3E"),
      CarCustomize(name: "Sahara Metallic Gold", color: "#C3834B"),
      CarCustomize(name: "Aqua Mint Metallic", color: "#8FCFBB"),
      CarCustomize(name: "Arctic Blue Metallic", color: "#85AFCD"),
      CarCustomize(name: "Mint Pearl", color: "#A8EEA4"),
      CarCustomize(name: "Graphite Metallic", color: "#545454"),
    ];
    return CarDetailCustomizeCampaign(
      typer: CarCustomizeCampaign.themes,
      items: items,
      selected: (int value) {
        setState(() {
          themeIndex = value;
        });
      },
    );
  }

  Widget _cabColor() {
    final items = [
      CarCustomize(
        name: "Regular Cab",
        img: Assets.icons.car.icCarDetailCabRegular.image(),
      ),
      CarCustomize(
        name: "Extended Cab",
        img: Assets.icons.car.icCarDetailCabExtended.image(),
      ),
      CarCustomize(
        name: "Crew Cab",
        img: Assets.icons.car.icCarDetailCabCrew.image(),
      ),
      CarCustomize(
        name: "Mega Cab",
        img: Assets.icons.car.icCarDetailCabMega.image(),
      ),
    ];
    return CarDetailCustomizeCampaign(
      typer: CarCustomizeCampaign.cab,
      items: items,
      selected: (int value) {},
    );
  }

  Widget _applyButton() {
    return AppButton(callback: () {}, title: "Apply changes");
  }

  Widget _themeCar() {
    return Positioned(
      top: -50,
      child: Container(
        // color: Colors.green,
        child: Opacity(opacity: 1, child: themeImages[themeIndex].image()),
      ),
    );
  }

  Widget _backgroundCar() {
    return Positioned(
      child: Container(
        width: 500,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Assets.icons.car.icCarDetailBackground.image(fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget _car() {
    return Positioned(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: bodyImages[bodyIndex].image(),
        ),
      ),
    );
  }
}
