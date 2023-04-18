import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calculators_controllers.dart';
import '../controller/theme_controller.dart';
import '../utils/colors.dart';
import '../widgets/custome_btn.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<ThemeController>();
    var calculatorsController = Get.find<CalculateController>();

    return GetBuilder<ThemeController>(
      builder: (context) {
        return Scaffold(
            backgroundColor: themeController.isDark
                ? DarkColors.scaffoldBgColor
                : LightColors.scaffoldBgColor,
            body: SafeArea(
              child: Column(
                children: [
                  GetBuilder<CalculateController>(
                    builder: (context) {
                      return outputSections(
                          themeController, calculatorsController);
                    },
                  ),
                  inputsSections(themeController, calculatorsController)
                ],
              ),
            ));
      },
    );
  }

  Expanded inputsSections(ThemeController themeController,
      CalculateController calculateController) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor),
          child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (contex, index) {
                switch (index) {
                  /// CLEAR BTN
                  case 0:
                    return CustomButton(
                        buttonTapped: () {
                          calculateController.clearInputAndOutput();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                  /// DELETE BTN
                  case 1:
                    return CustomButton(
                        buttonTapped: () {
                          calculateController.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                  /// EQUAL BTN
                  case 19:
                    return CustomButton(
                        buttonTapped: () {
                          calculateController.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                  default:
                    return CustomButton(
                        buttonTapped: () {
                          calculateController.onBtnTapped(buttons, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: isOperator(buttons[index])
                            ? LightColors.operatorColor
                            : themeController.isDark
                                ? Colors.white
                                : Colors.black,
                        text: buttons[index]);
                }
              }),
        ));
  }

  Expanded outputSections(ThemeController themeController,
      CalculateController calculateController) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  themeController.lightThem();
                },
                child: Icon(
                  Icons.light_mode_outlined,
                  color: themeController.isDark
                      ? Colors.white
                      : const Color.fromARGB(255, 20, 20, 20),
                  size: themeController.isDark ? 25 : 29,
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              GestureDetector(
                onTap: () {
                  themeController.darkThem();
                },
                child: Icon(
                  Icons.dark_mode_outlined,
                  color: themeController.isDark
                      ? Colors.white
                      : const Color.fromARGB(255, 20, 20, 20),
                  size: themeController.isDark ? 29 : 25,
                ),
              )
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  calculateController.userInput,
                  style: TextStyle(
                      color:
                          themeController.isDark ? Colors.white : Colors.black,
                      fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(calculateController.userOutput,
                    style: TextStyle(
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 32)),
              ),
            ],
          ),
        )
      ],
    ));
  }

  /// for color the operators
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
