import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rive/rive.dart';

class RiveControll extends GetxController {
  late StateMachineController? controllerDrawer;
  SMIBool? isFocus;
  SMIBool? IsPassword;
  SMIBool? login_fail;
  SMIBool? login_SUCCESS;
  SMIBool? eye_track;

  @override
  void onInit() {
    // TODO: implement onInit
    OnInit();
    super.onInit();
  }

  void OnInit() {}
  void onInitRive(Artboard artboard) {
    StateMachineController? riveCont = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
      onStateChange: (stateMachineName, stateName) {
        print(stateName);
      },
    );
    if (riveCont != null) {
      controllerDrawer = riveCont;
      riveCont.advanceInputs();
      // print(p0.animations);
      riveCont.inputs.map((e) {});
      artboard.addController(controllerDrawer!);

      IsPassword = controllerDrawer?.findSMI("IsPassword") as SMIBool?;
      login_SUCCESS = controllerDrawer?.findSMI("login_SUCCESS") as SMIBool?;
      login_fail = controllerDrawer?.findSMI("login_fail") as SMIBool?;
      isFocus = controllerDrawer?.findSMI("isFocus") as SMIBool?;
      eye_track = controllerDrawer?.findSMI("eye_track") as SMIBool?;
    }
  }
}
