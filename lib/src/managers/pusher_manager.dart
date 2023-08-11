// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:simple_products_app/src/config/api_config/api.dart';
// import 'package:simple_products_app/src/config/constants.dart';
//
// class PusherManager {
//   static PusherManager? _instance;
//   late final PusherChannelsFlutter _pusherChannelsFlutter =
//       PusherChannelsFlutter.getInstance();
//
//   // private constructor.
//   PusherManager._();
//
//   // singleton pattern.
//   static PusherManager get instance =>
//       _instance ?? (_instance = PusherManager._());
//
//   // init.
//   Future<void> init() async {
//     try {
//       await _pusherChannelsFlutter.init(
//         apiKey: Constants.pusherApiKey,
//         cluster: Constants.pusherCluster,
//         onConnectionStateChange: (String currentState, String previousState) {
//           debugPrint('starting [onConnectionStateChange][PusherService]...');
//           debugPrint(
//               "previousState: $previousState, currentState: $currentState");
//         },
//         onError: (String message, int? code, dynamic error) {
//           debugPrint('starting [onError][PusherService]...');
//           debugPrint("error: ${error?.toString()}");
//           debugPrint("error: $message");
//           debugPrint("error: $code");
//         },
//         onAuthorizer: onAuthorizer,
//       );
//     } catch (error) {
//       // it's already initialized.
//       debugPrint(error.toString());
//     }
//     await _pusherChannelsFlutter.connect();
//   }
//
//   // subscribe to channel.
//   Future<PusherChannel> subscribe({
//     required String channelName,
//   }) async {
//     return await _pusherChannelsFlutter.subscribe(
//       channelName: channelName,
//       onSubscriptionSucceeded: (data) {
//         debugPrint('connected to $channelName channel successfully...');
//       },
//       onSubscriptionError: () {
//         debugPrint('failed to connect to $channelName...');
//       },
//     );
//   }
//
//   // unsubscribe to channel.
//   Future<void> unsubscribe({
//     required String channelName,
//   }) async {
//     return await _pusherChannelsFlutter.unsubscribe(channelName: channelName);
//   }
//
//   // disconnect.
//   Future<void> disconnect() async {
//     await _pusherChannelsFlutter.disconnect();
//   }
//
//   // on authorizer.
//   dynamic onAuthorizer(
//       String channelName, String socketId, dynamic options) async {
//     final response = await Api.dio.post(
//       'vendor/authPusher',
//       data: {
//         'socket_id': socketId,
//         'channel_name': channelName,
//       },
//     );
//     return jsonDecode(response.data);
//   }
// }
