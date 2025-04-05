import 'package:flutter/material.dart';
import 'package:kidventure/models/celestial_body.dart';

final List<CelestialBody> celestialBodies = [
  CelestialBody(
    id: "شمس",
    name: "الشمس",
    icon: "☀️",
    color: Color(0xFFFF6B6B),
    description: "النجم الساطع في مركز نظامنا الشمسي",
    modelId: 1,
    type: "نجم",
    order: 0,
    modelPath: "assets/models/sun.glb",
    information: '''الاسم: الشمس
الحجم: قطرها ١.٣٩ مليون كيلومتر (نجم كبير)
اللون: أصفر-أبيض (بلازما متوهجة)
الوصف: مركز نظامنا الشمسي
ميزة خاصة: تمد الأرض بالطاقة والحياة من خلال الاندماج النووي''',
  ),
  CelestialBody(
    id: "عطارد",
    name: "عطارد",
    icon: "☿",
    color: Color(0xFFA7A7A7),
    description: "أصغر كواكب المجموعة الشمسية والأقرب للشمس",
    modelId: 2,
    type: "كوكب",
    order: 1,
    modelPath: "assets/models/mercury.glb",
    information: '''الاسم: عطارد
الحجم: قطره ٤,٨٨٠ كيلومتر (أصغر كوكب)
اللون: رمادي مع سطح صخري مليء بالفوهات
الوصف: أقرب كوكب إلى الشمس
ميزة خاصة: تغيرات درجة حرارة شديدة (من -١٧٣°م إلى ٤٢٧°م)''',
  ),
  CelestialBody(
    id: "زهرة",
    name: "الزهرة",
    icon: "♀",
    color: Color(0xFFE8B647),
    description: "الكوكب الثاني من الشمس",
    modelId: 3,
    type: "كوكب",
    order: 2,
    modelPath: "assets/models/venus.glb",
    information: '''الاسم: الزهرة
الحجم: قطره ١٢,١٠٤ كيلومتر (توأم الأرض)
اللون: أصفر-أبيض مع سحب كثيفة
الوصف: أسخن كوكب (متوسط درجة الحرارة ٤٦٢°م)
ميزة خاصة: يدور عكس اتجاه باقي الكواكب (دوران عكسي)''',
  ),
  CelestialBody(
    id: "ارض",
    name: "الأرض",
    icon: "🌍",
    color: Color(0xFF4ECDC4),
    description: "كوكبنا الجميل الذي نعيش عليه",
    modelId: 4,
    type: "كوكب",
    order: 3,
    modelPath: "assets/models/earth.glb",
    information: '''الاسم: الأرض
الحجم: قطرها ١٢,٧٤٢ كيلومتر
اللون: أزرق وأخضر (ماء ويابسة)
الوصف: الكوكب الوحيد المعروف بوجود حياة عليه
ميزة خاصة: ٧١٪ من سطحه مغطى بالماء''',
  ),
  CelestialBody(
    id: "قمر",
    name: "القمر",
    icon: "🌕",
    color: Color(0xFFD4D4D4),
    description: "القمر الطبيعي للأرض",
    modelId: 5,
    type: "قمر",
    order: 4,
    modelPath: "assets/models/moon.glb",
    information: '''الاسم: القمر
الحجم: قطره ٣,٤٧٤ كيلومتر (تابع الأرض)
اللون: رمادي مع سطح مليء بالفوهات
الوصف: الرفيق الطبيعي للأرض
ميزة خاصة: يسبب المد والجزر في محيطات الأرض''',
  ),
  CelestialBody(
    id: "مريخ",
    name: "المريخ",
    icon: "♂",
    color: Color(0xFFFF4B4B),
    description: "الكوكب الأحمر",
    modelId: 6,
    type: "كوكب",
    order: 5,
    modelPath: "assets/models/mars.glb",
    information: '''الاسم: المريخ
الحجم: قطره ٦,٧٧٩ كيلومتر
اللون: أحمر (بسبب تربة غنية بأكسيد الحديد)
الوصف: "الكوكب الأحمر"
ميزة خاصة: يحتوي على أكبر بركان في النظام الشمسي (جبل أوليمبوس)''',
  ),
  CelestialBody(
    id: "مشتري",
    name: "المشتري",
    icon: "♃",
    color: Color(0xFFE17055),
    description: "أكبر كوكب في نظامنا الشمسي",
    modelId: 7,
    type: "كوكب",
    order: 6,
    modelPath: "assets/models/jupiter.glb",
    information: '''الاسم: المشتري
الحجم: قطره ١٣٩,٨٢٠ كيلومتر (أكبر كوكب)
اللون: نطاقات برتقالية وبيضاء
الوصف: عملاق غازي مع البقعة الحمراء العظيمة
ميزة خاصة: له ٩٥ قمراً معروفاً''',
  ),
  CelestialBody(
    id: "زحل",
    name: "زحل",
    icon: "🪐",
    color: Color(0xFFFAD390),
    description: "الكوكب ذو الحلقات الرائعة",
    modelId: 8,
    type: "كوكب",
    order: 7,
    modelPath: "assets/models/saturn.glb",
    information: '''الاسم: زحل
الحجم: قطره ١١٦,٤٦٠ كيلومتر
اللون: ذهبي شاحب مع حلقات
الوصف: مشهور بحلقاته الجليدية
ميزة خاصة: يمكن أن يطفو على الماء (كثافته منخفضة)''',
  ),
  CelestialBody(
    id: "اورانوس",
    name: "أورانوس",
    icon: "♅",
    color: Color(0xFF81ECEC),
    description: "العملاق الجليدي المائل",
    modelId: 9,
    type: "كوكب",
    order: 8,
    modelPath: "assets/models/uranus.glb",
    information: '''الاسم: أورانوس
الحجم: قطره ٥٠,٧٢٤ كيلومتر
اللون: أزرق-أخضر شاحب (غلاف جوي من الميثان)
الوصف: عملاق جليدي مائل على جانبه
ميزة خاصة: أبرد درجة حرارة بين الكواكب (-٢٢٤°م)''',
  ),
  CelestialBody(
    id: "نبتون",
    name: "نبتون",
    icon: "♆",
    color: Color(0xFF4834D4),
    description: "الكوكب الأكثر عصفاً بالرياح",
    modelId: 10,
    type: "كوكب",
    order: 9,
    modelPath: "assets/models/neptune.glb",
    information: '''الاسم: نبتون
الحجم: قطره ٤٩,٢٤٤ كيلومتر
اللون: أزرق عميق
الوصف: أكثر كوكب عاصف (رياح بسرعة ٢,١٠٠ كم/ساعة)
ميزة خاصة: أبعد كوكب عن الشمس''',
  ),
];
