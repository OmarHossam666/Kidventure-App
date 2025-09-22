import 'package:audioplayers/audioplayers.dart';

void playLevelUpSound(AudioPlayer audioPlayer) async {
  await audioPlayer.play(AssetSource('sounds/level_up.mp3'));
}
