// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  objcHeaderOut: 'ios/Classes/messages.g.h',
  objcSourceOut: 'ios/Classes/messages.g.m',
  objcOptions: ObjcOptions(
    prefix: 'FLT',
  ),
  copyrightHeader: 'pigeons/copyright.txt',
))
class TextureMessage {
  TextureMessage(this.textureId);

  int textureId;
}

class LoopingMessage {
  LoopingMessage(this.textureId, this.isLooping);

  int textureId;
  bool isLooping;
}

class VolumeMessage {
  VolumeMessage(this.textureId, this.volume);

  int textureId;
  double volume;
}

class PlaybackSpeedMessage {
  PlaybackSpeedMessage(this.textureId, this.speed);

  int textureId;
  double speed;
}

class PositionMessage {
  PositionMessage(this.textureId, this.position);

  int textureId;
  int position;
}

class CreateMessage {
  CreateMessage({required this.httpHeaders});

  String? asset;
  String? uri;
  String? packageName;
  String? formatHint;
  Map<String?, String?> httpHeaders;
}

class MixWithOthersMessage {
  MixWithOthersMessage(this.mixWithOthers);

  bool mixWithOthers;
}

class AutomaticallyStartPictureInPictureMessage {
  AutomaticallyStartPictureInPictureMessage(
    this.textureId,
    this.enableStartPictureInPictureAutomaticallyFromInline,
  );

  int textureId;
  bool enableStartPictureInPictureAutomaticallyFromInline;
}

class SetPictureInPictureOverlayRectMessage {
  SetPictureInPictureOverlayRectMessage(
    this.textureId,
    this.rect,
  );

  int textureId;
  PictureInPictureOverlayRect? rect;
}

class PictureInPictureOverlayRect {
  PictureInPictureOverlayRect({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  });

  double top;
  double left;
  double width;
  double height;
}

class StartPictureInPictureMessage {
  StartPictureInPictureMessage(this.textureId);

  int textureId;
}

class StopPictureInPictureMessage {
  StopPictureInPictureMessage(this.textureId);

  int textureId;
}

@HostApi(dartHostTestHandler: 'TestHostVideoPlayerApi')
abstract class AVFoundationVideoPlayerApi {
  @ObjCSelector('initialize')
  void initialize();

  @ObjCSelector('create:')
  TextureMessage create(CreateMessage msg);

  @ObjCSelector('dispose:')
  void dispose(TextureMessage msg);

  @ObjCSelector('setLooping:')
  void setLooping(LoopingMessage msg);

  @ObjCSelector('setVolume:')
  void setVolume(VolumeMessage msg);

  @ObjCSelector('setPlaybackSpeed:')
  void setPlaybackSpeed(PlaybackSpeedMessage msg);

  @ObjCSelector('play:')
  void play(TextureMessage msg);

  @ObjCSelector('position:')
  PositionMessage position(TextureMessage msg);

  @ObjCSelector('seekTo:')
  void seekTo(PositionMessage msg);

  @ObjCSelector('pause:')
  void pause(TextureMessage msg);

  @ObjCSelector('setMixWithOthers:')
  void setMixWithOthers(MixWithOthersMessage msg);

  @ObjCSelector('isPictureInPictureSupported')
  bool isPictureInPictureSupported();

  @ObjCSelector('setPictureInPictureOverlayRect:')
  void setPictureInPictureOverlayRect(
      SetPictureInPictureOverlayRectMessage msg);

  @ObjCSelector('setAutomaticallyStartPictureInPicture:')
  void setAutomaticallyStartPictureInPicture(
      AutomaticallyStartPictureInPictureMessage msg);

  @ObjCSelector('startPictureInPicture:')
  void startPictureInPicture(StartPictureInPictureMessage msg);

  @ObjCSelector('stopPictureInPicture:')
  void stopPictureInPicture(StopPictureInPictureMessage msg);
}
