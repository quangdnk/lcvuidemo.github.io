import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/widgets/app_text.dart';

class CarDetailCustomizeCampaign extends StatefulWidget {
  const CarDetailCustomizeCampaign({
    super.key,
    this.selectedIndex,
    required this.typer,
    required this.items,
    required this.selected,
  });

  final int? selectedIndex;
  final CarCustomizeCampaign typer;
  final List<CarCustomize> items;
  final ValueChanged<int> selected;

  @override
  State<CarDetailCustomizeCampaign> createState() =>
      _CarDetailCustomizeCampaignState();
}

class _CarDetailCustomizeCampaignState
    extends State<CarDetailCustomizeCampaign> {
  int currentSelected = 0;
  CarCustomizeCampaign typer = CarCustomizeCampaign.body;
  List<CarCustomize> items = [];

  @override
  void initState() {
    super.initState();
    typer = widget.typer;
    currentSelected = widget.selectedIndex ?? 0;
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.boxWithBorder.copyWith(
        color: Colors.white.withValues(alpha: 0.8),
      ),
      child: Column(children: [_header()]),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.black3C,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: typer.img(),
              ),
              SizedBox(width: 5),
              AppText(typer.title()),
            ],
          ),
          SizedBox(height: 12),
          _line(),
          SizedBox(height: 12),
          _choiseContainer(),
          SizedBox(height: 12),
          _name(),
        ],
      ),
    );
  }

  Widget _choiseContainer() {
    return Container(
      height: typer.height(),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _item(index == currentSelected, index);
        },
      ),
    );
  }

  Widget _item(bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentSelected = index;
        });
        widget.selected(index);
      },
      child: Container(
        width: typer.height(),
        height: typer.height(),
        decoration: boxSelectConfig(isSelected),
        child:
            typer == CarCustomizeCampaign.cab
                ? _itemImg(index)
                : _itemColor(index, isSelected),
      ),
    );
  }

  BoxDecoration boxSelectConfig(bool isSelected) {
    return BoxDecoration(
      border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
      borderRadius: BorderRadius.circular(typer.height() / 2),
    );
  }

  Widget _itemImg(int index) {
    return SizedBox(width: 48, height: 48, child: items[index].img);
  }

  Widget _itemColor(int index, bool isSelected) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: items[index].color?.toColor(),
          border:
              !isSelected
                  ? Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 2,
                  )
                  : null,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _line() {
    return Container(
      height: 1,
      decoration: BoxDecoration(color: AppColors.black3C),
    );
  }

  Widget _name() {
    return Center(child: AppText(items[currentSelected].name));
  }
}

enum CarCustomizeCampaign { body, cab, themes }

extension CarCustomizeExtension on CarCustomizeCampaign {
  String title() {
    switch (this) {
      case CarCustomizeCampaign.body:
        return "Body color";
      case CarCustomizeCampaign.cab:
        return "CAB style";
      case CarCustomizeCampaign.themes:
        return "Theme color";
    }
  }

  Image img() {
    switch (this) {
      case CarCustomizeCampaign.body:
        return Assets.icons.car.carCustomizeBody.image();
      case CarCustomizeCampaign.cab:
        return Assets.icons.car.carDetailCustomizeCab.image();
      case CarCustomizeCampaign.themes:
        return Assets.icons.car.carCustomizeTheme.image();
    }
  }

  double height() {
    switch (this) {
      case CarCustomizeCampaign.body:
      case CarCustomizeCampaign.themes:
        return 52;
      default:
        return 64;
    }
  }
}

class CarCustomize {
  String name;
  String? color;
  Image? img;

  CarCustomize({required this.name, this.color, this.img});
}
