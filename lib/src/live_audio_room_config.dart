// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:zego_uikit/zego_uikit.dart';
// Project imports:
import 'package:zego_uikit_prebuilt_live_audio_room/src/components/audio_video/defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/live_audio_room_defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/live_audio_room_inner_text.dart';

/// Configuration for initializing the Live Audio Room.
/// This class is used as the [config] parameter for the constructor of [ZegoUIKitPrebuiltLiveAudioRoom].
class ZegoUIKitPrebuiltLiveAudioRoomConfig {
  /// Default initialization parameters for the host.
  /// If a configuration item does not meet your expectations, you can directly override its value.
  ///
  /// Example:
  ///
  /// ```dart
  /// ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
  /// ..hostSeatIndexes = [0]
  /// ```
  ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
      : role = ZegoLiveAudioRoomRole.host,
        takeSeatIndexWhenJoining = 0,
        closeSeatsWhenJoining = true,
        turnOnMicrophoneWhenJoining = true,
        useSpeakerWhenJoining = true,
        rootNavigator = false,
        userInRoomAttributes = const {},
        advanceConfigs = const {},
        seatConfig = ZegoLiveAudioRoomSeatConfig(),
        layoutConfig = ZegoLiveAudioRoomLayoutConfig(),
        hostSeatIndexes = const [0],
        topMenuBarConfig = ZegoTopMenuBarConfig(),
        bottomMenuBarConfig = ZegoBottomMenuBarConfig(),
        inRoomMessageConfig = ZegoInRoomMessageConfig(),
        memberListConfig = ZegoMemberListConfig(),
        audioEffectConfig = ZegoAudioEffectConfig(),
        durationConfig = ZegoLiveDurationConfig(),
        backgroundMediaConfig = ZegoBackgroundMediaConfig(),
        innerText = ZegoInnerText(),
        confirmDialogInfo = ZegoDialogInfo(
          title: 'Leave the room',
          message: 'Are you sure to leave the room?',
          cancelButtonName: 'Cancel',
          confirmButtonName: 'OK',
        );

  /// Default initialization parameters for the audience.
  /// If a configuration item does not meet your expectations, you can directly override its value.
  ///
  /// Example:
  ///
  /// ```dart
  /// ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
  /// ..hostSeatIndexes = [0]
  /// ```
  ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
      : role = ZegoLiveAudioRoomRole.audience,
        turnOnMicrophoneWhenJoining = false,
        closeSeatsWhenJoining = false,
        useSpeakerWhenJoining = true,
        rootNavigator = false,
        userInRoomAttributes = const {},
        advanceConfigs = const {},
        seatConfig = ZegoLiveAudioRoomSeatConfig(),
        layoutConfig = ZegoLiveAudioRoomLayoutConfig(),
        hostSeatIndexes = const [0],
        topMenuBarConfig = ZegoTopMenuBarConfig(),
        bottomMenuBarConfig = ZegoBottomMenuBarConfig(),
        inRoomMessageConfig = ZegoInRoomMessageConfig(),
        memberListConfig = ZegoMemberListConfig(),
        audioEffectConfig = ZegoAudioEffectConfig(),
        durationConfig = ZegoLiveDurationConfig(),
        backgroundMediaConfig = ZegoBackgroundMediaConfig(),
        innerText = ZegoInnerText();

  ZegoUIKitPrebuiltLiveAudioRoomConfig({
    this.turnOnMicrophoneWhenJoining = true,
    this.useSpeakerWhenJoining = true,
    this.closeSeatsWhenJoining = true,
    ZegoLiveAudioRoomSeatConfig? seatConfig,
    ZegoTopMenuBarConfig? topMenuBarConfig,
    ZegoBottomMenuBarConfig? bottomMenuBarConfig,
    ZegoLiveAudioRoomLayoutConfig? layoutConfig,
    ZegoInRoomMessageConfig? messageConfig,
    ZegoMemberListConfig? memberListConfig,
    ZegoAudioEffectConfig? effectConfig,
    ZegoLiveDurationConfig? durationConfig,
    ZegoBackgroundMediaConfig? backgroundMediaConfig,
    this.hostSeatIndexes = const [0],
    this.confirmDialogInfo,
    this.rootNavigator = false,
    this.onLeaveConfirmation,
    this.onLeaveLiveAudioRoom,
    this.onMeRemovedFromRoom,
    this.topBar,
    this.foreground,
    this.background,
    this.userAvatarUrl,
    this.userInRoomAttributes = const {},
    this.advanceConfigs = const {},
    this.onUserCountOrPropertyChanged,
    this.onSeatClosed,
    this.onSeatsOpened,
    this.onSeatClicked,
    this.onSeatsChanged,
    this.onSeatTakingRequested,
    this.onSeatTakingRequestCanceled,
    this.onInviteAudienceToTakeSeatFailed,
    this.onSeatTakingInviteRejected,
    this.onSeatTakingRequestFailed,
    this.onSeatTakingRequestRejected,
    this.onHostSeatTakingInviteSent,
    this.onMemberListMoreButtonPressed,
    ZegoInnerText? translationText,
  })  : seatConfig = seatConfig ?? ZegoLiveAudioRoomSeatConfig(),
        topMenuBarConfig = topMenuBarConfig ?? ZegoTopMenuBarConfig(),
        bottomMenuBarConfig = bottomMenuBarConfig ?? ZegoBottomMenuBarConfig(),
        layoutConfig = layoutConfig ?? ZegoLiveAudioRoomLayoutConfig(),
        inRoomMessageConfig = messageConfig ?? ZegoInRoomMessageConfig(),
        memberListConfig = memberListConfig ?? ZegoMemberListConfig(),
        audioEffectConfig = effectConfig ?? ZegoAudioEffectConfig(),
        durationConfig = durationConfig ?? ZegoLiveDurationConfig(),
        backgroundMediaConfig =
            backgroundMediaConfig ?? ZegoBackgroundMediaConfig(),
        innerText = translationText ?? ZegoInnerText();

  /// Specifies the initial role when joining the live audio room.
  /// The role change after joining is not constrained by this property.
  ZegoLiveAudioRoomRole role = ZegoLiveAudioRoomRole.audience;

  /// Specifies the seat to occupy when joining the live audio room.
  /// This is only valid when the role is set to host or speaker.
  int takeSeatIndexWhenJoining = -1;

  /// Specifies whether to lock the seat automatically after entering the room.
  /// It only takes effect when set by the host
  /// The default value is `true`.
  bool closeSeatsWhenJoining;

  /// Specifies the list of seats occupied by the host.
  /// Once specified, these seats can only be used by the host and cannot be occupied by speakers or audience members.
  /// The default value is `[0]`.
  List<int> hostSeatIndexes;

  /// The default layout of the audio chat room supports free layout with multiple rows and columns of seats.
  /// You can use this parameter to control the specific style of each row and column.
  ZegoLiveAudioRoomLayoutConfig layoutConfig;

  /// Configuration for all seats.
  ZegoLiveAudioRoomSeatConfig seatConfig;

  /// Whether to open the microphone when joining the audio chat room.
  ///
  /// If you want to join the audio chat room with your microphone closed, set this value to false;
  /// if you want to join the audio chat room with your microphone open, set this value to true.
  /// The default value is `true`.
  ///
  /// Note that this parameter is independent of the user's role.
  /// Even if the user is an audience, they can set this value to true, and they can start chatting with others through voice after joining the room.
  /// Therefore, in general, if the role is an audience, this value should be set to false.
  bool turnOnMicrophoneWhenJoining;

  /// Whether to use the speaker to play audio when joining the audio chat room.
  /// The default value is `true`.
  /// If this value is set to `false`, the system's default playback device, such as the earpiece or Bluetooth headset, will be used for audio playback.
  bool useSpeakerWhenJoining;

  /// The foreground of the live audio room.
  ///
  /// If you need to nest some widgets in [ZegoUIKitPrebuiltLiveAudioRoom], please use [foreground] nesting, otherwise these widgets will be lost when you minimize and restore the [ZegoUIKitPrebuiltLiveAudioRoom]
  Widget? foreground;
  Widget? topBar;

  /// The background of the audio chat room.
  ///
  /// You can use any Widget as the background of the audio chat room, such as a video, a GIF animation, an image, a web page, etc.
  /// If you need to dynamically change the background content, you will need to implement the logic for dynamic modification within the Widget you return.
  ///
  /// ```dart
  ///
  ///  // eg:
  /// ..background = Container(
  ///     width: size.width,
  ///     height: size.height,
  ///     decoration: const BoxDecoration(
  ///       image: DecorationImage(
  ///         fit: BoxFit.fitHeight,
  ///         image: ,
  ///       )));
  /// ```
  Widget? background;

  /// Configuration options for the top menu bar (toolbar).
  /// You can use these options to customize the appearance and behavior of the top menu bar.
  ZegoTopMenuBarConfig topMenuBarConfig;

  /// Configuration options for the bottom menu bar (toolbar).
  /// You can use these options to customize the appearance and behavior of the bottom menu bar.
  ZegoBottomMenuBarConfig bottomMenuBarConfig;

  /// Configuration options for the message list.
  ZegoInRoomMessageConfig inRoomMessageConfig;

  /// Configuration related to the bottom member list, including displaying the member list, member list styles, and more.
  ZegoMemberListConfig memberListConfig;

  @Deprecated('Since 2.8.5, please use inRoomMessageConfig instead')
  ZegoInRoomMessageViewConfig get inRoomMessageViewConfig =>
      inRoomMessageConfig;

  @Deprecated('Since 2.8.5, please use inRoomMessageConfig instead')
  set inRoomMessageViewConfig(ZegoInRoomMessageViewConfig config) =>
      inRoomMessageConfig = config;

  /// Configuration options for modifying all text content on the UI.
  /// All visible text content on the UI can be modified using this single property.
  ZegoInnerText innerText;

  /// You can use this to modify your voice and control reverb.
  ZegoAudioEffectConfig audioEffectConfig;

  /// Live audio room timing configuration.
  ZegoLiveDurationConfig durationConfig;

  /// Set the avatar URL for the current user.
  ///
  /// Note that the default maximum length for avatars is 64 bytes, exceeding this limit may result in the avatar not being displayed.
  /// We recommend using short URLs for setting the avatar URL.
  /// If you have a specific need for using long avatar URLs, please contact [technical support](https://www.zegocloud.com).
  String? userAvatarUrl;

  /// Set the attributes for the current user in the current joined audio room.
  /// [userAvatarUrl] actually uses this attribute and occupies a property with the key "avatar".
  ///
  /// For a single user, the sum of all Key-Value pairs must be within 100 bytes and a maximum of 20 pairs can be configured.
  /// Each Key must be within 8 bytes, Each Value must be within 64 bytes.
  /// If you want to increase the upper limit, please contact [technical support](https://www.zegocloud.com).
  Map<String, String> userInRoomAttributes;

  /// Confirmation dialog information when leaving the audio chat room.
  /// If not set, clicking the exit button will directly exit the audio chat room.
  /// If set, a confirmation dialog will be displayed when clicking the exit button, and you will need to confirm the exit before actually exiting.
  ZegoDialogInfo? confirmDialogInfo;

  /// same as Flutter's Navigator's param
  /// If `rootNavigator` is set to true, the state from the furthest instance of
  /// this class is given instead. Useful for pushing contents above all
  /// subsequent instances of [Navigator].
  bool rootNavigator;

  /// the config of background music, the feature currently only works for the host
  ZegoBackgroundMediaConfig backgroundMediaConfig;

  /// Set advanced engine configuration, Used to enable advanced functions.
  /// For details, please consult ZEGO technical support.
  Map<String, String> advanceConfigs;

  /// Confirmation callback method before leaving the audio chat room.
  ///
  /// If you want to perform more complex business logic before exiting the audio chat room, such as updating some records to the backend, you can use the [onLeaveConfirmation] parameter to set it.
  /// This parameter requires you to provide a callback method that returns an asynchronous result.
  /// If you return true in the callback, the prebuilt page will quit and return to your previous page, otherwise it will be ignored.
  Future<bool> Function(BuildContext context)? onLeaveConfirmation;

  /// This callback is triggered after leaving the audio chat room.
  /// You can perform business-related prompts or other actions in this callback.
  /// The default behavior is return to the previous page while it was in a normal state. If you override this callback, you must perform the page navigation yourself while it was in a normal state, otherwise the user will remain on the live audio page.
  ///
  /// The [isFromMinimizing] it means that the user left the chat room while it was in a minimized state.
  /// You **can not** return to the previous page while it was **in a minimized state**!!!
  /// On the other hand, if the value of the parameter is false, it means that the user left the chat room while it was in a normal state (i.e., not minimized).
  void Function(bool isFromMinimizing)? onLeaveLiveAudioRoom;

  /// This callback is triggered when local user removed from audio room.
  /// The default behavior is return to the previous page. If you override this callback, you must perform the page navigation yourself, otherwise the user will remain on the live audio page.
  Future<void> Function(String fromUserID)? onMeRemovedFromRoom;

  /// This callback method is called when someone requests to open your microphone, typically when the host wants to open the speaker's microphone.
  /// This method requires returning an asynchronous result.
  /// You can display a dialog in this callback to confirm whether to open the microphone.
  /// Alternatively, you can return `true` without any processing, indicating that when someone requests to open your microphone, it can be directly opened.
  /// By default, this method does nothing and returns `false`, indicating that others cannot open your microphone.
  Future<bool> Function(BuildContext context)?
      onMicrophoneTurnOnByOthersConfirmation;

  /// This callback method is triggered when the user count or attributes related to these users change.
  void Function(List<ZegoUIKitUser> users)? onUserCountOrPropertyChanged;

  /// Notification that a seat has been closed (locked).
  /// After closing a seat, audience members need to request permission from the host to join the seat, or the host can invite audience members directly.
  VoidCallback? onSeatClosed;

  /// Notification that a seat has been opened (unlocked).
  /// After opening a seat, all audience members can freely choose an empty seat to join and start chatting with others.
  VoidCallback? onSeatsOpened;

  /// A callback function that is called when a seat is clicked.
  ///
  /// The [index] parameter is the index of the seat that was clicked.
  /// The [user] parameter is the user who is currently sitting in the seat, or `null` if the seat is empty.
  ///
  /// Note that when you set this callback, the **default behavior** of clicking on a seat to display a menu **will be disabled**.
  /// You need to handle it yourself.
  /// You can refer to the usage of [ZegoLiveAudioRoomController] for reference.
  void Function(int index, ZegoUIKitUser? user)? onSeatClicked;

  /// A callback function that is called when someone gets on/off/switches seat
  ///
  /// The [takenSeats] parameter is a map that maps the index of each taken seat to the user who is currently sitting in that seat.
  /// The [untakenSeats] parameter is a list of the indexes of all untaken seats.
  void Function(
    Map<int, ZegoUIKitUser> takenSeats,
    List<int> untakenSeats,
  )? onSeatsChanged;

  /// The host has received a seat request from an `audience`.
  void Function(ZegoUIKitUser audience)? onSeatTakingRequested;

  /// The host has received a notification that the `audience` has canceled the seat request.
  void Function(ZegoUIKitUser audience)? onSeatTakingRequestCanceled;

  /// The host has received a notification that the invitation for the audience to take a seat has failed.
  /// This is usually due to network issues or if the audience has already logged out of the app and can no longer receive the invitation.
  VoidCallback? onInviteAudienceToTakeSeatFailed;

  /// The host has received a notification that the invitation for the audience to take a seat has been rejected.
  VoidCallback? onSeatTakingInviteRejected;

  /// The audience has received a notification that the application to take a seat has failed.
  /// This is usually due to network issues or the host has logged out of the app and can no longer receive seat applications.
  VoidCallback? onSeatTakingRequestFailed;

  /// The audience received a notification that their request to take seats was declined by the host.
  VoidCallback? onSeatTakingRequestRejected;

  /// The audience has received a notification that the host has invited them to take a seat.
  VoidCallback? onHostSeatTakingInviteSent;

  /// Callback method when the "More" button on the row corresponding to `user` in the member list is pressed.
  /// If you want to perform additional operations when the "More" button on the member list is clicked, such as viewing the profile of `user`.
  ///
  /// Note that when you set this callback, the **default behavior** of popping up a menu when clicking the "More" button on the member list will be **overridden**, and you need to handle it yourself.
  /// You can refer to the usage of `ZegoLiveAudioRoomController`.
  void Function(ZegoUIKitUser user)? onMemberListMoreButtonPressed;
}

/// Configuration options for controlling seat behavior and style.
/// This type is used for the [seatConfig] property in [ZegoUIKitPrebuiltLiveAudioRoomConfig].
class ZegoLiveAudioRoomSeatConfig {
  /// Whether to display a wave indicator around the avatar.
  bool showSoundWaveInAudioMode = true;

  /// The icon displayed for empty seats when all seats are open (seats in the audio chat room are not locked).
  Image? openIcon;

  /// The icon displayed for empty seats when all seats are closed (seats in the audio chat room are locked).
  Image? closeIcon;

  /// Use this to customize the foreground view of the seat, and the `ZegoUIKitPrebuiltLiveAudioRoom` will returns the current user on the seat and the corresponding seat index.
  ZegoAudioVideoViewForegroundBuilder? foregroundBuilder;

  /// Use this to customize the background view of the seat, and the `ZegoUIKitPrebuiltLiveAudioRoom` returns the current user on the seat and the corresponding seat index.
  ZegoAudioVideoViewBackgroundBuilder? backgroundBuilder;

  /// Use this to customize the avatar, and replace the default avatar with it.
  ///
  /// Example：
  ///
  /// ```dart
  ///
  ///  // eg:
  ///  avatarBuilder: (BuildContext context, Size size, ZegoUIKitUser? user, Map extraInfo) {
  ///    return user != null
  ///        ? Container(
  ///            decoration: BoxDecoration(
  ///              shape: BoxShape.circle,
  ///              image: DecorationImage(
  ///                image: NetworkImage(
  ///                  'https://your_server/app/avatar/${user.id}.png',
  ///                ),
  ///              ),
  ///            ),
  ///          )
  ///        : const SizedBox();
  ///  },
  ///
  /// ```
  ///
  ZegoAvatarBuilder? avatarBuilder;

  ZegoLiveAudioRoomSeatConfig({
    this.openIcon,
    this.closeIcon,
    this.showSoundWaveInAudioMode = true,
    this.avatarBuilder,
    this.foregroundBuilder,
    this.backgroundBuilder,
  });
}

/// Configuration options for the top menu bar (toolbar).
class ZegoTopMenuBarConfig {
  /// These buttons will displayed on the menu bar, order by the list
  /// only support [minimizingButton] right now
  List<ZegoMenuBarButtonName> buttons;

  ZegoTopMenuBarConfig({
    this.buttons = const [],
  });
}

/// Configuration options for the bottom menu bar (toolbar).
/// You can set the properties of this class through the [ZegoUIKitPrebuiltLiveAudioRoomConfig].[bottomMenuBarConfig] attribute.
class ZegoBottomMenuBarConfig {
  /// When set to `true`, the button for sending messages will be displayed.
  /// If you want to disable text messaging in the live audio room, set it to `false`.
  bool showInRoomMessageButton;

  /// The list of predefined buttons to be displayed when the user role is set to host.
  List<ZegoMenuBarButtonName> hostButtons = [];

  /// The list of predefined buttons to be displayed when the user role is set to speaker.
  List<ZegoMenuBarButtonName> speakerButtons = [];

  /// The list of predefined buttons to be displayed when the user role is set to audience.
  List<ZegoMenuBarButtonName> audienceButtons = [];

  /// The list of custom buttons to be displayed when the user role is set to host.
  List<Widget> hostExtendButtons = [];

  /// The list of custom buttons to be displayed when the user role is set to speaker.
  List<Widget> speakerExtendButtons = [];

  /// The list of custom buttons to be displayed when the user role is set to audience.
  List<Widget> audienceExtendButtons = [];

  /// Controls the maximum number of buttons (including predefined and custom buttons) to be displayed in the menu bar (toolbar).
  /// When the number of buttons exceeds the `maxCount` limit, a "More" button will appear.
  /// Clicking on it will display a panel showing other buttons that cannot be displayed in the menu bar (toolbar).
  int maxCount;

  ZegoBottomMenuBarConfig({
    this.showInRoomMessageButton = true,
    this.hostButtons = const [
      ZegoMenuBarButtonName.soundEffectButton,
      ZegoMenuBarButtonName.toggleMicrophoneButton,
      ZegoMenuBarButtonName.showMemberListButton,
      ZegoMenuBarButtonName.closeSeatButton,
    ],
    this.speakerButtons = const [
      ZegoMenuBarButtonName.soundEffectButton,
      ZegoMenuBarButtonName.toggleMicrophoneButton,
      ZegoMenuBarButtonName.showMemberListButton,
    ],
    this.audienceButtons = const [
      ZegoMenuBarButtonName.showMemberListButton,
      ZegoMenuBarButtonName.applyToTakeSeatButton,
    ],
    this.hostExtendButtons = const [],
    this.speakerExtendButtons = const [],
    this.audienceExtendButtons = const [],
    this.maxCount = 5,
  });
}

/// Control options for the bottom-left message list.
/// This class is used for the [inRoomMessageConfig] property of [ZegoUIKitPrebuiltLiveAudioRoomConfig].
///
/// If you want to customize chat messages, you can specify the [itemBuilder] in [ZegoInRoomMessageViewConfig].
///
/// Example:
///
/// ZegoInRoomMessageViewConfig(
///   itemBuilder: (BuildContext context, ZegoRoomMessage message) {
///     return ListTile(
///       title: Text(message.message),
///       subtitle: Text(message.user.id),
///     );
///   },
/// );
class ZegoInRoomMessageConfig {
  /// Triggered when has click on the message item
  ZegoInRoomMessageViewItemPressEvent? onMessageClick;

  /// Triggered when a pointer has remained in contact with the message item at
  /// the same location for a long period of time.
  ZegoInRoomMessageViewItemPressEvent? onMessageLongPress;

  /// Use this to customize the style and content of each chat message list item.
  /// For example, you can modify the background color, opacity, border radius, or add additional information like the sender's level or role.
  ZegoInRoomMessageItemBuilder? itemBuilder;

  /// background
  Widget? background;

  /// If set to `false`, the message list will be hidden. The default value is `true`.
  bool visible;

  /// The width of chat message list view
  double? width;

  /// The height of chat message list view
  double? height;

  /// The offset of chat message list view bottom-left position
  Offset? bottomLeft;

  /// display user name in message list view or not
  bool showName;

  /// display user avatar in message list view or not
  bool showAvatar;

  /// The opacity of the background color for chat message list items, default value of 0.5.
  /// If you set the [backgroundColor], the [opacity] setting will be overridden.
  double opacity;

  /// The background of chat message list items
  /// If you set the [backgroundColor], the [opacity] setting will be overridden.
  /// You can use `backgroundColor.withOpacity(0.5)` to set the opacity of the background color.
  Color? backgroundColor;

  /// The max lines of chat message list items, default value is not limit.
  int? maxLines;

  /// The name text style of chat message list items
  TextStyle? nameTextStyle;

  /// The message text style of chat message list items
  TextStyle? messageTextStyle;

  /// The border radius of chat message list items
  BorderRadiusGeometry? borderRadius;

  /// The paddings of chat message list items
  EdgeInsetsGeometry? paddings;

  /// resend button icon
  Widget? resendIcon;

  ZegoInRoomMessageConfig({
    this.visible = true,
    this.width,
    this.height,
    this.bottomLeft,
    this.opacity = 0.5,
    this.maxLines,
    this.nameTextStyle,
    this.messageTextStyle,
    this.backgroundColor,
    this.borderRadius,
    this.paddings,
    this.resendIcon,
    this.background,
    this.itemBuilder,
    this.onMessageClick,
    this.onMessageLongPress,
    this.showName = true,
    this.showAvatar = true,
  });
}

@Deprecated('Since 2.8.5, please use ZegoInRoomMessageConfig instead')
typedef ZegoInRoomMessageViewConfig = ZegoInRoomMessageConfig;

/// Configuration for the member list.
///
/// You can use the [ZegoUIKitPrebuiltLiveAudioRoomConfig.memberListConfig] property to set the properties inside this class.
///
/// If you want to use a custom member list item view, you can set the [ZegoMemberListConfig.itemBuilder] property, and pass your custom view's builder function to it.
///
/// For example, suppose you have implemented a `CustomMemberListItem` component that can render a member list item view based on the user information. You can set it up like this:
///
///```dart
/// ZegoMemberListConfig(
///   itemBuilder: (BuildContext context, Size size, ZegoUIKitUser user, Map<String, dynamic> extraInfo) {
///     return CustomMemberListItem(user: user);
///   },
/// );
///```
///
/// In this example, we pass the builder function of the custom view, `CustomMemberListItem`, to the [itemBuilder] property so that the member list item will be rendered using the custom component.
///
/// In addition, you can listen for item click events through [onClicked].
class ZegoMemberListConfig {
  /// Custom member list item view.
  ZegoMemberListItemBuilder? itemBuilder;

  /// You can listen to the user click event on the member list,
  /// for example, if you want to display specific information about a member after they are clicked.
  void Function(ZegoUIKitUser user)? onClicked;

  ZegoMemberListConfig({
    this.itemBuilder,
    this.onClicked,
  });
}

/// Configuration options for voice changer and reverberation effects.
/// This class is used for the [audioEffectConfig] property in [ZegoUIKitPrebuiltLiveAudioRoomConfig].
class ZegoAudioEffectConfig {
  /// List of voice changer effects.
  /// If you don't want a certain effect, simply remove it from the list.
  List<VoiceChangerType> voiceChangeEffect;

  /// List of reverb effects.
  /// If you don't want a certain effect, simply remove it from the list.
  List<ReverbType> reverbEffect;

  ZegoAudioEffectConfig({
    this.voiceChangeEffect = const [
      VoiceChangerType.littleGirl,
      VoiceChangerType.deep,
      VoiceChangerType.robot,
      VoiceChangerType.ethereal,
      VoiceChangerType.littleBoy,
      VoiceChangerType.female,
      VoiceChangerType.male,
      VoiceChangerType.optimusPrime,
      VoiceChangerType.crystalClear,
      VoiceChangerType.cMajor,
      VoiceChangerType.aMajor,
      VoiceChangerType.harmonicMinor,
    ],
    this.reverbEffect = const [
      ReverbType.ktv,
      ReverbType.hall,
      ReverbType.concert,
      ReverbType.rock,
      ReverbType.smallRoom,
      ReverbType.largeRoom,
      ReverbType.valley,
      ReverbType.recordingStudio,
      ReverbType.basement,
      ReverbType.popular,
      ReverbType.gramophone,
    ],
  });

  /// @nodoc
  ZegoAudioEffectConfig.none({
    this.voiceChangeEffect = const [],
    this.reverbEffect = const [],
  });

  /// @nodoc
  bool get isSupportVoiceChange => voiceChangeEffect.isNotEmpty;

  /// @nodoc
  bool get isSupportReverb => reverbEffect.isNotEmpty;
}

/// Live Audio Room timing configuration.
class ZegoLiveDurationConfig {
  /// Whether to display Live Audio Room timing.
  bool isVisible;

  /// Call timing callback function, called every second.
  ///
  /// Example: Do something after 5 minutes.
  /// ..durationConfig.isVisible = true
  /// ..durationConfig.onDurationUpdate = (Duration duration) {
  ///   if (duration.inSeconds >= 5 * 60) {
  ///     ///  Do something...
  ///   }
  /// }
  void Function(Duration)? onDurationUpdate;

  ZegoLiveDurationConfig({
    this.isVisible = true,
    this.onDurationUpdate,
  });
}

/// Live Audio Room background media configuration.
class ZegoBackgroundMediaConfig {
  /// the path of background music, which can be either a local path or a network address.
  /// supported formats by default include MP3, MP4, FLV, WAV, AAC, M3U8, and FLAC.
  String? path;

  /// whether to repeat playback.
  bool enableRepeat;

  ZegoBackgroundMediaConfig({
    this.path,
    this.enableRepeat = true,
  });
}
