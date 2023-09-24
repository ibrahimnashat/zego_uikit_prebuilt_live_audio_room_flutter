// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_uikit/zego_uikit.dart';

// Project imports:
import 'package:zego_uikit_prebuilt_live_audio_room/src/components/dialogs.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/components/pop_up_manager.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/live_audio_room_defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/live_audio_room_inner_text.dart';

/// @nodoc
Future<void> checkPermissions({
  required BuildContext context,
  required ZegoInnerText translationText,
  required bool rootNavigator,
  required ZegoPopUpManager popUpManager,
  required ValueNotifier<bool> kickOutNotifier,
  bool isShowDialog = false,
  List<Permission> checkStatuses = const [Permission.microphone],
}) async {
  if (checkStatuses.contains(Permission.camera)) {
    await Permission.camera.status.then((status) async {
      if (status != PermissionStatus.granted) {
        if (isShowDialog) {
          await showAppSettingsDialog(
            context,
            translationText.cameraPermissionSettingDialogInfo,
            rootNavigator: rootNavigator,
            kickOutNotifier: kickOutNotifier,
            popUpManager: popUpManager,
          );
        }
      }
    });
  }

  if (checkStatuses.contains(Permission.microphone)) {
    await Permission.microphone.status.then((status) async {
      if (status != PermissionStatus.granted) {
        if (isShowDialog) {
          await showAppSettingsDialog(
            context,
            translationText.microphonePermissionSettingDialogInfo,
            rootNavigator: rootNavigator,
            kickOutNotifier: kickOutNotifier,
            popUpManager: popUpManager,
          );
        }
      }
    });
  }
}

Future<void> requestPermissions({
  required BuildContext context,
  required ZegoInnerText innerText,
  required bool rootNavigator,
  required ZegoPopUpManager popUpManager,
  required ValueNotifier<bool> kickOutNotifier,
  bool isShowDialog = false,
  List<Permission> checkStatuses = const [Permission.microphone],
}) async {
  await checkStatuses
      .request()
      .then((Map<Permission, PermissionStatus> statuses) async {
    if (checkStatuses.contains(Permission.camera) &&
        statuses[Permission.camera] != PermissionStatus.granted) {
      if (isShowDialog) {
        await showAppSettingsDialog(
          context,
          innerText.cameraPermissionSettingDialogInfo,
          rootNavigator: rootNavigator,
          kickOutNotifier: kickOutNotifier,
          popUpManager: popUpManager,
        );
      }
    }

    if (checkStatuses.contains(Permission.microphone) &&
        statuses[Permission.microphone] != PermissionStatus.granted) {
      if (isShowDialog) {
        await showAppSettingsDialog(
          context,
          innerText.microphonePermissionSettingDialogInfo,
          rootNavigator: rootNavigator,
          kickOutNotifier: kickOutNotifier,
          popUpManager: popUpManager,
        );
      }
    }
  });
}

Future<bool> showAppSettingsDialog(
  BuildContext context,
  ZegoDialogInfo dialogInfo, {
  required bool rootNavigator,
  required ZegoPopUpManager popUpManager,
  required ValueNotifier<bool> kickOutNotifier,
}) async {
  if (kickOutNotifier.value) {
    ZegoLoggerService.logInfo(
      'local user is kick-out, ignore show app settings dialog',
      tag: 'live audio room',
      subTag: 'prebuilt',
    );
    return false;
  }

  final key = DateTime.now().millisecondsSinceEpoch;
  popUpManager.addAPopUpSheet(key);

  return showLiveDialog(
    context: context,
    title: dialogInfo.title,
    content: dialogInfo.message,
    leftButtonText: dialogInfo.cancelButtonName,
    leftButtonCallback: () {
      Navigator.of(
        context,
        rootNavigator: rootNavigator,
      ).pop(false);
    },
    rightButtonText: dialogInfo.confirmButtonName,
    rightButtonCallback: () async {
      await openAppSettings();
      Navigator.of(
        context,
        rootNavigator: rootNavigator,
      ).pop(false);
    },
  ).then((result) {
    popUpManager.removeAPopUpSheet(key);

    return result;
  });
}
