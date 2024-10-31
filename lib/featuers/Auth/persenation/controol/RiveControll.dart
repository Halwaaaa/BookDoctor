import 'dart:async';
import 'dart:developer';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rive/rive.dart';

class RiveControll extends GetxController {
  late StateMachineController? controllerDrawer;
  Timer? timer;
  SMIBool? isFocus;
  SMIBool? IsPassword;
  SMITrigger? login_fail;
  SMITrigger? login_SUCCESS;
  SMINumber? eye_track;

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

      initSMI();
      print(isFocus?.value);
    }
  }

  void FailedStatues() {
    login_fail?.change(true);

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      login_fail?.change(true);
    });
  }

  void CancelFaild() {
    timer?.cancel();
    login_fail!.value = false;
  }

  void initSMI() {
    IsPassword = controllerDrawer?.findSMI("IsPassword") as SMIBool?;
    login_SUCCESS = controllerDrawer?.findSMI("login_success") as SMITrigger?;
    login_fail = controllerDrawer?.findSMI("login_fail") as SMITrigger?;
    isFocus = controllerDrawer?.findSMI("isFocus") as SMIBool?;
    eye_track = controllerDrawer?.findSMI("eye_track") as SMINumber?;
  }
}
