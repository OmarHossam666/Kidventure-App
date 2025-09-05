import '../models/interactive_story.dart';

// List of all interactive stories for primary school children
final List<InteractiveStory> interactiveStories = [
  // Story 1: The Magic Library
  InteractiveStory(
    title: "The Magic Library",
    lottiePath: "assets/lotties/magic_library_lottie.json",
    segments: [
      StorySegment(
        text:
            "Wow! You found a colorful library hidden behind a giant oak tree that nobody else has ever noticed before! The building shimmers with twinkling lights, and a sign above the door reads 'MAGICAL STORIES INSIDE' in letters that change color every few seconds.\n\nAs you step inside, you gasp in amazement! Books actually GLOW different colors - some blue, some purple, some golden - and they FLOAT through the air like butterflies! The bookshelves reach all the way to the ceiling, which looks like a night sky filled with stars.\n\nSuddenly, the big wooden door goes WHOOSH and closes behind you with a heavy thud. You turn around and try the handle, but it won't budge! A sparkly blue book with silver edges flies off a nearby shelf, leaving a trail of glitter in the air. It hovers right in front of your eyes and slowly opens its pages, revealing beautiful moving pictures!",
      ),
      StorySegment(
        text:
            "The magical book's pages glow brighter, illuminating your amazed face. The pictures move and shift until they form a magnificent illustration of a grand hallway with three super cool doors at the end. Each door looks completely different from the others!\n\nThe first door is made of polished wood with mysterious carvings. The second door shimmers with silver and has tiny books embedded in its frame. The third door is covered in colorful gemstones that sparkle in the light.\n\nAbove each door, words appear in glittery, floating letters. These aren't just any doors - they're magical doorways to different adventures! But you can only choose one, and you need to solve the special riddle to find the right one. The book's pages ruffle excitedly, as if encouraging you to try!",
        puzzle: Puzzle(
          type: "logic",
          question:
              "Read each riddle carefully to pick the right door:\n\nDoor 1 with wooden carvings: 'I can be read but I'm not a book. I can tell stories but I can't speak. What am I?'\n\nDoor 2 with silver and tiny books: 'I hold stories but I'm not a library. I have a spine but I'm not an animal. What am I?'\n\nDoor 3 with gemstones: 'I have words but I can't talk. I have leaves but I'm not a tree. What am I?'\n\nWhich door leads to the best adventure?",
          answer: "Door 2",
        ),
      ),
      StorySegment(
        text:
            "You walk slowly across the shining marble floor toward your chosen door. Your footsteps echo in the quiet library, and you notice tiny fairy-like lights following you, dancing around your head like curious fireflies.\n\nAs you get closer to the door, you see incredible details you couldn't spot from far away. The tiny books embedded in the silver frame are actually moving, their pages flipping by themselves as if being read by invisible hands!\n\nYou reach out your hand, but before you can touch it, the doorknob - shaped like an open book - spins all by itself - like magic! It twists three times clockwise, then once counterclockwise, glowing brighter with each turn. The door opens with a long CREEEEEAK sound that echoes throughout the library.\n\nA warm, golden light spills out from the opening, and you smell the sweet scent of flowers and honey. Soft music drifts through the doorway, inviting you to step through. What amazing adventure waits for you on the other side? Taking a deep breath, you gather your courage and step forward...",
      ),
    ],
    choices: [
      StoryChoice(
        choiceText: "Go through Door 2 (the book door)",
        ending: StoryEnding(
          text:
              "HOORAY! You step through the doorway and the scene transforms around you! You're standing in the most magnificent garden you've ever seen, with flowers in every color imaginable - even some colors you've never seen before! Rainbow butterflies flit between giant blooms, and the paths are lined with glowing stones that light up wherever you step.\n\nBut the most amazing thing? The animals here can TALK! A fluffy brown bunny wearing a tiny blue vest hops over to you, followed by a clever-looking fox with spectacles and an elegant owl with feathers that shimmer like opals.\n\n\"You solved the riddle!\" they cheer together, dancing around you in a circle. \"We've been waiting for a smart human like you for ages!\"\n\nThe fox adjusts his spectacles and explains that their magical garden has been lonely without human visitors. The owl, who introduces herself as Professor Hootington, teaches you special magic words so you can visit again anytime you want.\n\n\"Just whisper 'Librus Imaginarium' while holding any book, and you'll return to us,\" she hoots wisely.\n\nYou spend the day playing fantastic games with your new animal friends, learning about magical plants that can cure hiccups, and eating delicious honey cakes served on floating lily pads. When it's time to go home, the bunny gives you a special bookmark made of ever-changing colors that will help you remember your adventure.\n\n\"Your smart thinking helped you make new friends!\" the animals call as you wave goodbye. \"Come back soon - we have thousands more adventures waiting just for you!\"",
          skillFocused: "problem-solving",
        ),
      ),
      StoryChoice(
        choiceText: "Try a different door",
        ending: StoryEnding(
          text:
              "You change your mind at the last second and dash toward another door. As soon as you touch its handle, the entire hallway spins like a carousel! When everything stops moving, you find yourself in a magnificent circular room with walls lined with puzzles of every kind imaginable!\n\nThere are jigsaw puzzles that float in mid-air, riddles written in glowing ink that rearrange themselves when you get close, and mysterious contraptions with buttons, levers, and dials waiting to be figured out. The ceiling changes to show different landscapes - snowy mountains, underwater reefs, outer space - depending on which puzzle you're working on!\n\nA friendly librarian with sparkly glasses and hair that changes color based on her mood appears beside you. \"Welcome to the Puzzle Mastery Room!\" she says with a kind smile. \"Very few visitors ever find this place - you must have an adventurous spirit!\"\n\nYou spend hours solving one fascinating puzzle after another. Each time you complete one, it transforms into a tiny crystal figurine that joins a collection on a special shelf with your name magically engraved on it. The librarian explains that you can come back anytime to continue your collection.\n\n\"Some of these puzzles have remained unsolved for centuries,\" she whispers, clearly impressed by your skills.\n\nWhen it's finally time to leave, the librarian gives you a special bookmark that glimmers with hidden patterns. \"Come back anytime, puzzle master!\" she says, waving as a door appears in the wall. \"The library always has new mysteries waiting just for clever minds like yours!\"\n\nAs you step through the door and find yourself back home, you notice the bookmark in your hand still sparkles with magic. What an incredible adventure!",
          skillFocused: "decision-making",
        ),
      ),
    ],
    description:
        "Discover a magical library filled with flying books, talking animals, and doors to amazing adventures!",
  ),

  // Story 2: The Lost Treasure Map
  InteractiveStory(
    title: "The Lost Treasure Map",
    lottiePath: "assets/lotties/lost_treasure_map.json",
    segments: [
      StorySegment(
        text:
            "On a perfect sunny Saturday morning, you decide to build the world's best fort in your backyard. You grab your plastic shovel with the blue handle and start digging a moat around where your fortress will stand. Your dog Buddy watches curiously, his tail wagging as he sits nearby.\n\nSuddenly, your shovel hits something hard with a loud CLUNK! \"What's that?\" you wonder aloud. Buddy barks excitedly and runs over to help you dig, his paws sending dirt flying everywhere.\n\nAfter removing more soil, you discover an old wooden chest with metal corners, covered in dirt and moss! It looks super old, like something pirates might have buried hundreds of years ago! Your heart beats faster as you carefully lift it out of the hole. It's not very heavy, but it has a rusty lock that breaks off when you touch it.\n\nWith trembling fingers, you lift the creaky lid, and GASP! Inside is an actual treasure map! The paper is yellowed and crispy-looking, with burned edges like someone tried to make it look extra old and important. It has X marks, squiggly lines representing rivers, and sparkly stickers showing special landmarks. The most amazing part? It shows YOUR neighborhood, but with secret spots you've never noticed before!",
      ),
      StorySegment(
        text:
            "Clutching the mysterious map in your hands, you study it carefully. There's your house, the corner store where you get ice cream, and your school - but there are also strange symbols and dotted lines connecting different places. The most interesting part is a pathway marked with tiny footprints leading to the community park three blocks away.\n\nYou grab your explorer kit - a magnifying glass, a compass that your grandpa gave you for your birthday, a small water bottle, and some cookies (explorers need energy!) - and set off following the map. Buddy trots alongside you, sniffing the ground as if he's helping track the treasure.\n\nAt the park entrance, you check the map again. It shows a winding path through the playground, past the duck pond, and toward the giant oak tree that everyone calls 'Old Whiskers' because of its long, drooping branches that look like a wizard's beard.\n\nYour heart thumps with excitement as you approach the massive tree. According to the map, this is the spot! You inspect the enormous trunk and discover a hollow opening partially hidden by hanging branches. Peering inside, you spot something that definitely doesn't belong there - a rolled-up piece of parchment tied with a shimmering rainbow ribbon! Your fingers tingle as you carefully pull it out and unroll it. It's a super fun riddle written in fancy letters with little drawings around the edges!",
        puzzle: Puzzle(
          type: "reading",
          question:
              "The parchment reads:\n\n'Brave treasure hunter with eyes so keen,\nTo find what's hidden yet to be seen,\nSolve this riddle if you dare,\nAnd the secret treasure will be there:\n\nI'm up in the sky during the day,\nI make flowers grow with my bright ray,\nI'm super bright and very hot,\nWithout me, warmth there would be not.\n\nWhat am I? The answer leads to where you should search next!'",
          answer: "sun",
        ),
      ),
      StorySegment(
        text:
            "\"The sun!\" you exclaim proudly, after thinking about the riddle. Buddy barks as if agreeing with your answer, his tail wagging even faster. You squint up at the bright sky, protecting your eyes with your hand as you consider what this means.\n\nLooking back at the original treasure map, you notice something you missed before - there are little sun symbols drawn in two different locations in the park! One is near the ancient sundial that stands in the center of the rose garden, and the other is close to the playground where the sun-shaped climbing frame stands.\n\nYou tap your chin thoughtfully, trying to decide which location makes more sense. The sundial actually measures time using the sun's position, which seems like a cleverer hiding spot for treasure. But the playground equipment is shaped like a sun, which could also be the answer!\n\nBuddy sits patiently beside you, his head tilted to one side as if he's putting his thinking cap on too. A light breeze rustles through the leaves of Old Whiskers, almost like the tree is whispering a hint. You need to make a decision. Put on your thinking cap - where could the treasure be hiding?",
      ),
    ],
    choices: [
      StoryChoice(
        choiceText: "Look near the sundial in the park",
        ending: StoryEnding(
          text:
              "Following your instincts, you hurry over to the beautiful stone sundial standing in the middle of the rose garden. The dial casts a sharp shadow exactly at the 3 o'clock position. As you circle around it, you notice something unusual - one of the decorative stones at the base looks slightly different from the others.\n\nGetting down on your knees for a better look, you discover the stone is actually loose! With a bit of wiggling, it comes free, revealing a secret compartment underneath! Buddy barks excitedly, his front paws dancing on the spot as you reach inside.\n\nAMAZING DISCOVERY! You pull out a box decorated with seashells, tiny mirrors, and star patterns made of silver wire. It's absolutely beautiful, like something from a fairy tale! Your hands shake a little as you carefully open the lid.\n\nInside, nestled on a bed of blue velvet, are the most wonderful treasures! There's a collection of unusual rocks that actually GLOW in the dark when you shadow them with your hand - some are purple, others blue and green. There's also a perfect crystal shaped like a star, a tiny brass telescope that actually works, and several old coins with strange symbols on them.\n\nA handwritten note on fancy paper sits on top: 'Awesome job, treasure hunter! Your reading skills and clever thinking led you right to me. These treasures are from my adventures around the world, and now they belong to someone smart enough to follow the clues. Keep exploring, keep reading, and keep discovering the magic in everyday places! Your skills are SUPER!'\n\nAs you carefully pack your treasures to take home, you notice one last thing in the box - a small, blank journal with your initials mysteriously embossed on the cover and a note saying 'For your own adventure stories'! You can't wait to show everyone what you've found and start writing about your treasure-hunting adventure!",
          skillFocused: "reading comprehension",
        ),
      ),
      StoryChoice(
        choiceText: "Dig under the swing set",
        ending: StoryEnding(
          text:
              "After thinking carefully, you decide to check out the playground area. The map shows a small X near the swing set, and you're determined to investigate thoroughly. Buddy follows along, occasionally sniffing the ground as if he's helping with the search.\n\nYou reach the playground and examine the area around the swings. Nothing seems unusual at first. You dig in a few spots with your small shovel, but find nothing except more dirt and a few lost marbles.\n\nFeeling a bit disappointed, you sit on one of the swings to think. Buddy lies down in the shade nearby, watching you with his intelligent brown eyes. As you swing higher and higher, something catches your eye - the shadow of the swing set! It's pointing directly to a specific spot - the colorful bench under the big maple tree!\n\n\"That's it, Buddy!\" you shout, jumping off the swing with excitement. \"It's not under the swings - it's where the shadow points!\"\n\nRacing over to the bench, you notice one of the wooden planks looks slightly different from the others. It has tiny suns carved into it, almost invisible unless you're really looking carefully. With a bit of effort, you manage to slide the plank aside, revealing a hidden compartment!\n\nThe treasure box is there! It's made of polished wood with metal corners and a beautiful compass design on the lid. When you open it, you discover it's filled with amazing treasures! There are shiny coins (chocolate ones wrapped in gold foil!), a collection of unusual smooth stones from around the world (each labeled with its origin), a working compass with a glow-in-the-dark face, and a magnifying glass with a handle carved to look like a dragon.\n\nThe most special item is a badge made of polished brass that says 'Master Detective' and comes with a note: 'Congratulations on solving the mystery! Sometimes the answer isn't where you first look, but requires observing the world from different angles. Your persistence and clever thinking have proven you're a true problem solver. Wear this badge proudly, and remember that every place holds secrets waiting to be discovered by those smart enough to look beyond the obvious.'\n\nYou pin the badge to your shirt immediately, feeling a surge of pride. Buddy barks happily, as if he's congratulating you too. You're the best puzzle solver in town, and now you have the badge to prove it! As you head home with your treasures, you wonder what other mysteries might be hiding in ordinary places, just waiting for you to discover them.",
          skillFocused: "problem-solving",
        ),
      ),
    ],
    description:
        'Become a real treasure hunter right in your own neighborhood! Follow clues, solve riddles, and discover amazing surprises!',
  ),

  // Story 3: The Whispering Forest
  InteractiveStory(
    title: "The Whispering Forest",
    lottiePath: "assets/lotties/forest_lottie.json",
    segments: [
      StorySegment(
        text:
            "During your camping trip with your family, you spot a beautiful blue butterfly with wings that seem to glow in the sunlight. It flutters right in front of your face, almost as if it wants you to follow it! You look back at your campsite where Mom and Dad are busy setting up the tent, then decide to follow the butterfly just a little way into the trees.\n\nThe butterfly leads you deeper into a strange forest where the trees grow closer together and the leaves aren't just green - they're purple, blue, and gold too! Even stranger, they go WHISPER-WHISPER-WHISPER as you walk past, like they're talking about you! Some of the whispers sound like giggles, others like little songs.\n\nSuddenly, you realize you can't see your family's campsite anymore! The colorful trees have closed around you, and every direction looks the same. Are you lost? Your heart beats faster as you try to figure out which way to go.",
      ),
      StorySegment(
        text:
            "Just as you're beginning to worry, a tiny light appears between two mossy trees. The light grows brighter and PING! - a fairy no bigger than your hand appears! She has sparkling silver wings that flutter faster than hummingbird wings, and she wears a dress made of what looks like flower petals sewn together with spider silk.\n\n\"Don't be afraid,\" she says in a voice that sounds like tiny bells. \"I'm Lilywink, and I can help you find your way back to your family! But first...\" she circles around your head, leaving a trail of silver sparkles, \"...you need to show me you can listen carefully! This forest has many dangers, and only those who listen well can travel safely.\"\n\nLilywink explains that there are three magical paths through the trees, each leading to a different place. She flutters from path to path, pointing out each one with her tiny wand that glows at the tip.",
        puzzle: Puzzle(
          type: "listening",
          question:
              "Listen super carefully to Lilywink's instructions!\n\nShe speaks quickly, so pay close attention: \"The path with PRETTY PINK FLOWERS that smell like candy leads to the sleeping dragons' cave - they get very grumpy if woken up! The path with SPOTTED ORANGE AND RED MUSHROOMS that glow at night is safe and leads to friendly forest folk. The path with YUMMY PURPLE BERRIES that look delicious actually leads to quicksand that will swallow you up! Remember, in the magic forest, things aren't always what they seem!\"\n\nWhich path will keep you safe and help you find your way?",
          answer: "mushrooms",
        ),
      ),
      StorySegment(
        text:
            "You point to your chosen path, and Lilywink claps her tiny hands excitedly. \"Good listening!\" she exclaims, sprinkling more silver dust that tickles your nose and makes you sneeze.\n\nAs you start walking down the path, the most amazing thing happens - the trees actually bow their branches aside to make way for you! Their leaves rustle in what sounds almost like applause, and flowers turn their faces to watch you pass, some of them opening and closing like they're winking.\n\nThe spotted mushrooms along the path begin to glow with a gentle orange light as the forest grows dimmer. They light your way like little lanterns. In the distance, through the trees, you hear something magical - the sound of tiny music, laughter, and what might be a celebration!",
      ),
    ],
    choices: [
      StoryChoice(
        choiceText: "Follow the mushroom path",
        ending: StoryEnding(
          text:
              "Following the glowing mushroom path, you walk around a massive oak tree and gasp in wonder! There, nestled in a clearing bathed in moonlight, is an entire village of tiny fairies! Their homes are built in mushroom caps, flower blooms, and hollow logs, all connected by tiny bridges made of twigs and spider silk. Hundreds of fairies fly around, their wings creating a rainbow of colors as they dart back and forth.\n\nWhen they see you with Lilywink, they shower you with handfuls of sparkly dust that floats in the air around you. \"You listened to the directions!\" they cheer, dancing in circles. \"Most humans just follow the pretty flowers and wake up the dragons!\"\n\nThe fairy queen - twice as tall as the others and wearing a crown made of dewdrops - floats down to greet you. She presents you with a magical acorn necklace that glows with a warm light. \"This will always help you find your way in any forest,\" she explains. \"Because you showed excellent listening skills, you'll never truly be lost again.\"\n\nAfter a wonderful feast of honey cakes no bigger than your fingernail and berry juice served in acorn cups, the fairies form a flying parade to guide you back to your family. Your parents are just starting to look for you when you emerge from the trees.\n\n\"Where did you get that beautiful necklace?\" your mom asks, noticing your new treasure.\n\nYou smile and hold the glowing acorn tight. \"It was a gift from new friends,\" you say, as you notice Lilywink waving from a nearby branch before disappearing in a shower of sparkles. \"I'll tell you all about it around the campfire!\"",
          skillFocused: "listening comprehension",
        ),
      ),
      StoryChoice(
        choiceText: "Change your mind and take the berry path",
        ending: StoryEnding(
          text:
              "At the last moment, you hesitate. The purple berries on the third path look so juicy and delicious, and somehow familiar - like berries your grandma puts in muffins. Could the fairy have been testing you by saying something that wasn't true? You decide to trust your instincts and change direction, turning onto the berry path.\n\nLilywink squeaks in surprise and zooms after you. \"Wait! Are you sure about this?\" she asks, her tiny face worried.\n\nSure enough, after walking for a few minutes, you notice the ground is still perfectly solid - no quicksand at all! Instead, the path widens into a beautiful clearing where a family of rabbits with unusual silver-tipped ears is gathering berries in tiny baskets.\n\nThe largest rabbit stands up on his hind legs when he sees you. To your amazement, he speaks! \"Welcome, brave human! Not many listen to their inner voice instead of fairy warnings. Sometimes the path that seems dangerous is exactly the right one for you.\"\n\nThe rabbit family shows you a special shortcut through a hollow log that brings you directly back to your campsite. When you emerge, your family is just starting to toast marshmallows around the campfire. They cheer when they see you!\n\n\"Where have you been?\" your dad asks with a smile. \"We were about to send out a search party!\"\n\nAs you join your family around the fire, you notice one of the silver-eared rabbits watching from the edge of the clearing. It winks at you before hopping away into the twilight forest.\n\nYou smile, knowing you've discovered something most people never will - that sometimes taking a chance and trusting yourself leads to the most wonderful surprises of all!",
          skillFocused: "decision-making",
        ),
      ),
    ],
    description:
        'Explore a magical forest where trees whisper secrets, fairies fly, and your choices lead to amazing discoveries!',
  ),

  // Story 4: Robot Friend Repair
  InteractiveStory(
    title: "Robot Friend Repair",
    lottiePath: "assets/lotties/robot_repair_lottie.json",
    segments: [
      StorySegment(
        text:
            "Your toy robot suddenly lights up and starts moving ALL BY ITSELF! But oh no! It's making funny noises and walking wonky. 'BEEP-BOOP-HELP-ME-PLEASE,' it says with a sad robot face.",
      ),
      StorySegment(
        text:
            "The robot's chest opens to show a screen with a blinking puzzle. You need to fix its programming by solving a super cool pattern!",
        puzzle: Puzzle(
          type: "problem-solving",
          question:
              "Can you figure out what comes next? Square, Circle, Triangle, Square, Circle, ?",
          answer: "triangle",
        ),
      ),
      StorySegment(
        text:
            "Woo-hoo! The robot's eyes light up brighter! You fixed part of it! Now you need to choose which special tool will finish the repairs!",
      ),
    ],
    choices: [
      StoryChoice(
        choiceText: "Use the magical red screwdriver",
        ending: StoryEnding(
          text:
              "ZAP! WHIRR! The robot spins around and then gives you a high-five! 'THANK-YOU-NEW-FRIEND!' it beeps happily. Your robot buddy now follows you everywhere and teaches you cool counting games. You're the best robot fixer in the whole wide world!",
          skillFocused: "problem-solving",
        ),
      ),
      StoryChoice(
        choiceText: "Press the big blue button",
        ending: StoryEnding(
          text:
              "The button makes a BOOP sound! The robot asks you to count all the gears in its tummy - there are 10! When you tell it the answer, it spins with joy! 'FRIEND-FOREVER!' it beeps. Now you have a robot friend who helps you with your homework and tells funny jokes!",
          skillFocused: "problem-solving",
        ),
      ),
    ],
    description:
        'Help a broken robot toy that comes to life! Solve fun puzzles and make a mechanical best friend forever!',
  ),

  // Story 5: Space Adventure
  InteractiveStory(
    title: "Space Adventure",
    lottiePath: "assets/lotties/astronaut-with-space-shuttle.json",
    segments: [
      StorySegment(
        text:
            "ZOOM! Your bedroom transforms into a spaceship cockpit! Stars and planets whiz past your window as you pilot your very own rocket ship through the galaxy!",
      ),
      StorySegment(
        text:
            "BEEP! BEEP! ALERT! Asteroid alert! Big space rocks are heading right for your ship! The computer needs you to answer a space question to turn on the special protective shields!",
        puzzle: Puzzle(
          type: "reading",
          question:
              "Read the screen carefully: Which planet is known as the 'Red Planet' because it looks reddish-orange in the night sky? A) Earth B) Mars C) Jupiter",
          answer: "B) Mars",
        ),
      ),
      StorySegment(
        text:
            "SHIELDS UP! You saved the ship! Now you get to pick a super cool place to visit before flying back to Earth. Where will your space adventure take you?",
      ),
    ],
    choices: [
      StoryChoice(
        choiceText: "Visit the amazing water planet",
        ending: StoryEnding(
          text:
              "SPLASH! The water planet has oceans with rainbow waves and dolphin aliens that can talk! They teach you their special bubble language and how to swim super fast with a special flipper move. Your reading skills impressed them so much they made you an honorary ocean friend!",
          skillFocused: "reading comprehension",
        ),
      ),
      StoryChoice(
        choiceText: "Explore the sparkly crystal moon",
        ending: StoryEnding(
          text:
              "The crystal moon GLOWS with a thousand colors! Inside the echo caves, you play an amazing listening game with moon creatures. You win a tiny crystal that changes color depending on your mood! When you get home, your family can hardly believe your incredible space adventure story!",
          skillFocused: "listening comprehension",
        ),
      ),
    ],
    description:
        'Blast off into space in your very own rocket ship! Dodge asteroids, meet alien friends, and explore amazing planets!',
  ),
];
