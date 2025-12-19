// lib/data/emoji_helpers.dart

import 'package:flutter/material.dart';

Color? getColorFromName(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    case 'brown':
      return Colors.brown;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    default:
      return null;
  }
}

String getAnimalEmoji(String animal) {
  switch (animal.toLowerCase()) {
    case 'lion':
      return '🦁';
    case 'tiger':
      return '🐯';
    case 'elephant':
      return '🐘';
    case 'giraffe':
      return '🦒';
    case 'monkey':
      return '🐒';
    case 'bear':
      return '🐻';
    case 'zebra':
      return '🦓';
    case 'kangaroo':
      return '🦘';
    case 'panda':
      return '🐼';
    case 'cheetah':
      return '🐆';
    default:
      return '🐾';
  }
}

String getFruitEmoji(String fruit) {
  switch (fruit.toLowerCase()) {
    case 'apple':
      return '🍎';
    case 'banana':
      return '🍌';
    case 'orange':
      return '🍊';
    case 'grapes':
      return '🍇';
    case 'strawberry':
      return '🍓';
    case 'pineapple':
      return '🍍';
    case 'mango':
      return '🥭';
    case 'cherry':
      return '🍒';
    case 'watermelon':
      return '🍉';
    case 'peach':
      return '🍑';
    default:
      return '🍏';
  }
}

String getVehicleEmoji(String vehicle) {
  switch (vehicle.toLowerCase()) {
    case 'car':
      return '🚗';
    case 'bus':
      return '🚌';
    case 'bicycle':
      return '🚲';
    case 'motorcycle':
      return '🏍';
    case 'truck':
      return '🚚';
    case 'train':
      return '🚆';
    case 'airplane':
      return '✈️';
    case 'boat':
      return '⛵️';
    case 'scooter':
      return '🛵';
    case 'helicopter':
      return '🚁';
    default:
      return '🚙';
  }
}

String getNumberEmoji(String number) {
  switch (number.toLowerCase()) {
    case 'one':
      return '1️⃣';
    case 'two':
      return '2️⃣';
    case 'three':
      return '3️⃣';
    case 'four':
      return '4️⃣';
    case 'five':
      return '5️⃣';
    case 'six':
      return '6️⃣';
    case 'seven':
      return '7️⃣';
    case 'eight':
      return '8️⃣';
    case 'nine':
      return '9️⃣';
    case 'ten':
      return '🔟';
    default:
      return number;
  }
}

String getPlantEmoji(String plant) {
  switch (plant.toLowerCase()) {
    case 'rose':
      return '🌹';
    case 'tulip':
      return '🌷';
    case 'sunflower':
      return '🌻';
    case 'daisy':
      return '🌼';
    case 'orchid':
      return '🏵';
    case 'lily':
      return '🌸';
    case 'daffodil':
      return '🌼';
    case 'marigold':
      return '🌼';
    case 'lavender':
      return '💜';
    case 'peony':
      return '🌸';
    default:
      return '🌿';
  }
}

String getWeatherEmoji(String weather) {
  switch (weather.toLowerCase()) {
    case 'sunny':
      return '☀️';
    case 'rainy':
      return '🌧';
    case 'cloudy':
      return '☁️';
    case 'stormy':
      return '⛈';
    case 'snowy':
      return '❄️';
    case 'windy':
      return '🌬';
    case 'foggy':
      return '🌫';
    case 'lightning':
      return '⚡️';
    case 'hail':
      return '🌨';
    case 'overcast':
      return '☁️';
    default:
      return '🌤';
  }
}

String getSportsEmoji(String sport) {
  switch (sport.toLowerCase()) {
    case 'soccer':
      return '⚽️';
    case 'basketball':
      return '🏀';
    case 'tennis':
      return '🎾';
    case 'baseball':
      return '⚾️';
    case 'swimming':
      return '🏊';
    case 'running':
      return '🏃';
    case 'cycling':
      return '🚴';
    case 'skiing':
      return '🎿';
    case 'skating':
      return '⛸';
    case 'volleyball':
      return '🏐';
    default:
      return '🤾';
  }
}

String getMusicEmoji(String music) {
  switch (music.toLowerCase()) {
    case 'piano':
      return '🎹';
    case 'guitar':
      return '🎸';
    case 'drums':
      return '🥁';
    case 'violin':
      return '🎻';
    case 'flute':
      return '🎶';
    case 'saxophone':
      return '🎷';
    case 'trumpet':
      return '🎺';
    case 'harp':
      return '🎼';
    case 'cello':
      return '🎻';
    case 'microphone':
      return '🎤';
    default:
      return '🎵';
  }
}
