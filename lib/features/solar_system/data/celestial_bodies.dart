import 'package:flutter/material.dart';
import 'package:kidventure/features/solar_system/models/celestial_body.dart';

final List<CelestialBody> celestialBodies = [
  CelestialBody(
    id: "sun",
    name: "Sun",
    icon: "☀️",
    color: Color(0xFFFF6B6B),
    description: "The bright star at the center of our Solar System",
    modelId: 1,
    type: "star",
    order: 0,
    modelPath: "assets/models/sun.glb",
    information: '''Name: Sun
Size: 1.39 million km diameter (a big star)
Color: Yellow-white (glowing plasma)
Description: Center of our Solar System
Special Feature: Gives Earth energy and life through nuclear fusion''',
  ),
  CelestialBody(
    id: "mercury",
    name: "Mercury",
    icon: "☿",
    color: Color(0xFFA7A7A7),
    description: "The smallest planet in our Solar System and closest to the Sun",
    modelId: 2,
    type: "planet",
    order: 1,
    modelPath: "assets/models/mercury.glb",
    information: '''Name: Mercury
Size: 4,880 km diameter (smallest planet)
Color: Gray with a rocky, cratered surface
Description: Closest planet to the Sun
Special Feature: Extreme temperature changes (from -173°C to 427°C)''',
  ),
  CelestialBody(
    id: "venus",
    name: "Venus",
    icon: "♀",
    color: Color(0xFFE8B647),
    description: "The second planet from the Sun",
    modelId: 3,
    type: "planet",
    order: 2,
    modelPath: "assets/models/venus.glb",
    information: '''Name: Venus
Size: 12,104 km diameter (Earth's twin)
Color: Yellowish-white with thick clouds
Description: Hottest planet (average temperature 462°C)
Special Feature: Spins backward compared to other planets (retrograde rotation)''',
  ),
  CelestialBody(
    id: "earth",
    name: "Earth",
    icon: "🌍",
    color: Color(0xFF4ECDC4),
    description: "Our beautiful home planet",
    modelId: 4,
    type: "planet",
    order: 3,
    modelPath: "assets/models/earth.glb",
    information: '''Name: Earth
Size: 12,742 km diameter
Color: Blue and green (water and land)
Description: The only planet known to have life
Special Feature: 71% of its surface is covered by water''',
  ),
  CelestialBody(
    id: "moon",
    name: "Moon",
    icon: "🌕",
    color: Color(0xFFD4D4D4),
    description: "Earth's natural satellite",
    modelId: 5,
    type: "moon",
    order: 4,
    modelPath: "assets/models/moon.glb",
    information: '''Name: Moon
Size: 3,474 km diameter (Earth's companion)
Color: Gray with a cratered surface
Description: Earth's natural friend
Special Feature: Causes ocean tides on Earth''',
  ),
  CelestialBody(
    id: "mars",
    name: "Mars",
    icon: "♂",
    color: Color(0xFFFF4B4B),
    description: "The Red Planet",
    modelId: 6,
    type: "planet",
    order: 5,
    modelPath: "assets/models/mars.glb",
    information: '''Name: Mars
Size: 6,779 km diameter
Color: Red (because of iron-rich soil)
Description: "The Red Planet"
Special Feature: Has the largest volcano in the Solar System (Olympus Mons)''',
  ),
  CelestialBody(
    id: "jupiter",
    name: "Jupiter",
    icon: "♃",
    color: Color(0xFFE17055),
    description: "The largest planet in our Solar System",
    modelId: 7,
    type: "planet",
    order: 6,
    modelPath: "assets/models/jupiter.glb",
    information: '''Name: Jupiter
Size: 139,820 km diameter (biggest planet)
Color: Orange and white bands
Description: Gas giant with the Great Red Spot storm
Special Feature: Has 95 known moons''',
  ),
  CelestialBody(
    id: "saturn",
    name: "Saturn",
    icon: "🪐",
    color: Color(0xFFFAD390),
    description: "The planet with amazing rings",
    modelId: 8,
    type: "planet",
    order: 7,
    modelPath: "assets/models/saturn.glb",
    information: '''Name: Saturn
Size: 116,460 km diameter
Color: Pale gold with rings
Description: Famous for its icy rings
Special Feature: Could float in water (very low density)''',
  ),
  CelestialBody(
    id: "uranus",
    name: "Uranus",
    icon: "♅",
    color: Color(0xFF81ECEC),
    description: "The tilted ice giant",
    modelId: 9,
    type: "planet",
    order: 8,
    modelPath: "assets/models/uranus.glb",
    information: '''Name: Uranus
Size: 50,724 km diameter
Color: Pale blue-green (methane atmosphere)
Description: Ice giant tilted on its side
Special Feature: Coldest temperature among planets (-224°C)''',
  ),
  CelestialBody(
    id: "neptune",
    name: "Neptune",
    icon: "♆",
    color: Color(0xFF4834D4),
    description: "The windiest planet",
    modelId: 10,
    type: "planet",
    order: 9,
    modelPath: "assets/models/neptune.glb",
    information: '''Name: Neptune
Size: 49,244 km diameter
Color: Deep blue
Description: Stormiest planet (winds at 2,100 km/hour)
Special Feature: Farthest planet from the Sun''',
  ),
];
