import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';

class MyTextInputErrorController extends GetxController {
  var errors = "".obs;

  bool get hasErrors {
    return errors.value.length > 0;
  }

  String get error {
    return errors.value;
  }
}

class MyTextInput extends GetWidget<MyTextInputErrorController> {
  dynamic validator;

  IconData icon;

  String hintText;
  String labelText;
  TextEditingController textController;
  TextInputType keyboardType;
  String errorsControllerTag;

  bool disabled = false;

  int maxLength;
  bool maxLengthEnforced;

  MyTextInput({
    Key key,
    this.validator,
    this.icon,
    this.hintText,
    this.labelText,
    this.textController,
    this.keyboardType,
    this.errorsControllerTag,
    this.disabled = false,
    this.maxLength = null,
    this.maxLengthEnforced = false,
  }) : super(key: key) {
    if (errorsControllerTag != null) {
      Get.put(MyTextInputErrorController(), tag: errorsControllerTag);
    } else {
      Get.lazyPut(() => MyTextInputErrorController());
    }
  }

  get controller =>
      Get.find<MyTextInputErrorController>(tag: errorsControllerTag);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        FormBuilderTextField(
            autocorrect: true,
            autofocus: false,
            enabled: !disabled,
            controller: textController,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLengthEnforced: maxLengthEnforced,
            onChanged: (value) {
              if (errorsControllerTag != null) {
                MyTextInputErrorController c =
                    Get.find<MyTextInputErrorController>(
                        tag: errorsControllerTag);
                c.errors.value = "";
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Cc.red_prudential,
                  width: 3,
                ),
              ),
              prefixIcon: IconTheme(
                data: IconThemeData(
                  color: Cc.red_prudential,
                ),
                child: Icon(icon),
              ),
            ),
            validator: validator),
        Obx(() {
          if (controller != null) {
            return controller.hasErrors
                ? Text(
                    controller.error,
                    textAlign: TextAlign.left,
                    style: Ts.robotoExtraSmall.copyWith(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  )
                : SizedBox();
          } else {
            return SizedBox();
          }
        })
      ],
    );
  }
}
