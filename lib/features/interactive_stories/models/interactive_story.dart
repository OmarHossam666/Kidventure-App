class InteractiveStory {
  final String title;
  final List<StorySegment> segments;
  final List<StoryChoice> choices;
  final String lottiePath;
  final String description;

  InteractiveStory({
    required this.title,
    required this.segments,
    required this.choices,
    required this.lottiePath,
    required this.description,
  });

  factory InteractiveStory.fromJson(Map<String, dynamic> json) {
    return InteractiveStory(
      title: json['title'],
      lottiePath: json['lottiePath'],
      segments:
          (json['segments'] as List)
              .map((segment) => StorySegment.fromJson(segment))
              .toList(),
      choices:
          (json['choices'] as List)
              .map((choice) => StoryChoice.fromJson(choice))
              .toList(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'lottiePath': lottiePath,
      'segments': segments.map((segment) => segment.toJson()).toList(),
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'description': description,
    };
  }
}

class StorySegment {
  final String text;
  final Puzzle? puzzle;

  StorySegment({required this.text, this.puzzle});

  factory StorySegment.fromJson(Map<String, dynamic> json) {
    return StorySegment(
      text: json['text'],
      puzzle: json['puzzle'] != null ? Puzzle.fromJson(json['puzzle']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'puzzle': puzzle?.toJson()};
  }
}

class Puzzle {
  final String type;
  final String question;
  final String answer;

  Puzzle({required this.type, required this.question, required this.answer});

  factory Puzzle.fromJson(Map<String, dynamic> json) {
    return Puzzle(
      type: json['type'],
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'question': question, 'answer': answer};
  }
}

class StoryChoice {
  final String choiceText;
  final StoryEnding ending;

  StoryChoice({required this.choiceText, required this.ending});

  factory StoryChoice.fromJson(Map<String, dynamic> json) {
    return StoryChoice(
      choiceText: json['choiceText'],
      ending: StoryEnding.fromJson(json['ending']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'choiceText': choiceText, 'ending': ending.toJson()};
  }
}

class StoryEnding {
  final String text;
  final String skillFocused;

  StoryEnding({required this.text, required this.skillFocused});

  factory StoryEnding.fromJson(Map<String, dynamic> json) {
    return StoryEnding(text: json['text'], skillFocused: json['skillFocused']);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'skillFocused': skillFocused};
  }
}
