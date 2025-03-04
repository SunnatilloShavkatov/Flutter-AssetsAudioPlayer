import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';

enum _PlayingBuilderType {
  isPlaying,
  volume,
  currentPosition,
  playSpeed,
  forwardRewindSpeed,
  current,
  loopMode,
  isBuffering,
  realtimePlayingInfos,
  playerState,
}

typedef PlayingWidgetBuilder = Widget Function(
    BuildContext context, bool isPlaying);
typedef LoopModeWidgetBuilder = Widget Function(
    BuildContext context, LoopMode loopMode);
typedef VolumeWidgetBuilder = Widget Function(
    BuildContext context, double volume);
typedef PlaySpeedWidgetBuilder = Widget Function(
    BuildContext context, double playSpeed);
typedef ForwardRewindSpeedWidgetBuilder = Widget Function(
    BuildContext context, double playSpeed);
typedef PositionWidgetBuilder = Widget Function(
    BuildContext context, Duration position);
typedef CurrentWidgetBuilder = Widget Function(
    BuildContext context, Playing playing);
typedef IsBufferingWidgetBuilder = Widget Function(
    BuildContext context, bool isBuffering);
typedef RealtimeWidgetBuilder = Widget Function(
    BuildContext context, RealtimePlayingInfos realtimePlayingInfos);
typedef PlayerStateBuilder = Widget Function(
    BuildContext context, PlayerState playerState);

class PlayerBuilder extends StatefulWidget {
  final AssetsAudioPlayer player;
  final dynamic builder;
  final _PlayingBuilderType builderType;

  const PlayerBuilder.isPlaying(
      {super.key, required this.player, required PlayingWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.isPlaying;

  const PlayerBuilder.isBuffering(
      {super.key, required this.player, required PlayingWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.isBuffering;

  const PlayerBuilder.loopMode(
      {super.key, required this.player, required LoopModeWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.loopMode;

  const PlayerBuilder.realtimePlayingInfos(
      {super.key, required this.player, required RealtimeWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.realtimePlayingInfos;

  const PlayerBuilder.volume(
      {super.key, required this.player, required VolumeWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.volume;

  const PlayerBuilder.playSpeed(
      {super.key, required this.player, required PlaySpeedWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.playSpeed;

  const PlayerBuilder.currentPosition(
      {super.key, required this.player, required PositionWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.currentPosition;

  const PlayerBuilder.forwardRewindSpeed(
      {super.key,
      required this.player,
      ForwardRewindSpeedWidgetBuilder? builder})
      : builder = builder,
        builderType = _PlayingBuilderType.forwardRewindSpeed;

  const PlayerBuilder.current(
      {super.key, required this.player, required CurrentWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.current;

  const PlayerBuilder.playerState(
      {super.key, required this.player, required PlayerStateBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.playerState;

  @override
  _PlayerBuilderState createState() => _PlayerBuilderState();
}

class _PlayerBuilderState extends State<PlayerBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget.builderType) {
      case _PlayingBuilderType.isPlaying:
        return StreamBuilder(
          stream: widget.player.isPlaying,
          initialData: false,
          builder: (context, snap) {
            return widget.builder(context, snap.data);
          },
        );
      case _PlayingBuilderType.isBuffering:
        return StreamBuilder(
          stream: widget.player.isBuffering,
          initialData: false,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.loopMode:
        return StreamBuilder(
          stream: widget.player.loopMode,
          initialData: LoopMode.none,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.volume:
        return StreamBuilder(
          stream: widget.player.volume,
          initialData: AssetsAudioPlayer.defaultVolume,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.currentPosition:
        return StreamBuilder(
          stream: widget.player.currentPosition,
          initialData: Duration.zero,
            builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.playSpeed:
        return StreamBuilder(
          stream: widget.player.playSpeed,
          initialData: AssetsAudioPlayer.defaultPlaySpeed,
           builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.forwardRewindSpeed:
        return StreamBuilder(
          stream: widget.player.forwardRewindSpeed,
           builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.current:
        return StreamBuilder(
          stream: widget.player.current,
          builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.realtimePlayingInfos:
        return StreamBuilder(
          stream: widget.player.realtimePlayingInfos,
           builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
      case _PlayingBuilderType.playerState:
        return StreamBuilder(
          stream: widget.player.playerState,
          initialData: PlayerState.stop,
            builder: (context, snap) {
            if (snap.hasData) {
              return widget.builder(context, snap.data)!;
            } else {
              return const SizedBox();
            }
          },
        );
    }
  }
}

class PlayerGroupBuilder extends StatefulWidget {
  final AssetsAudioPlayerGroup player;
  final dynamic builder;
  final _PlayingBuilderType builderType;

  const PlayerGroupBuilder.isPlaying(
      {super.key, required this.player, required PlayingWidgetBuilder builder})
      : builder = builder,
        builderType = _PlayingBuilderType.isPlaying;

  @override
  _PlayerBuilderGroupState createState() => _PlayerBuilderGroupState();
}

class _PlayerBuilderGroupState extends State<PlayerGroupBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget.builderType) {
      case _PlayingBuilderType.isPlaying:
        return StreamBuilder(
          stream: widget.player.isPlaying,
          initialData: false,
          builder: (context, snap) {
            return widget.builder(context, snap.data);
          },
        );
      default: /* do nothing */
    }
    return const SizedBox();
  }
}