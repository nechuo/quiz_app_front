import 'package:quiz_app_front/pages/game_page/models/question.dart';

final List<Question> questions = <Map<String, Object>>[
  {
    "id": 1,
    "question":
        "Quel organite est souvent surnommé la « centrale énergétique » de la cellule ?",
    "options": ["La mitochondrie", "Le ribosome", "Le noyau", "Le lysosome"],
    "correctAnswerIndex": 0,
  },
  {
    "id": 2,
    "question":
        "Quel scientifique a observé pour la première fois des « cellules » dans du liège en 1665 ?",
    "options": [
      "Antonie van Leeuwenhoek",
      "Theodor Schwann",
      "Robert Hooke",
      "Louis Pasteur",
    ],
    "correctAnswerIndex": 2,
  },
  {
    "id": 3,
    "question":
        "Quel organite contient la majeure partie de l'ADN d'une cellule eucaryote ?",
    "options": [
      "L'appareil de Golgi",
      "Le cytoplasme",
      "Le réticulum endoplasmique",
      "Le noyau",
    ],
    "correctAnswerIndex": 3,
  },
  {
    "id": 4,
    "question":
        "Quelle structure délimite la cellule et contrôle les échanges avec l'extérieur ?",
    "options": [
      "La lame basale",
      "Le cytosquelette",
      "La paroi cellulaire",
      "La membrane plasmique",
    ],
    "correctAnswerIndex": 3,
  },
  {
    "id": 5,
    "question": "Les ribosomes sont le siège de quel processus cellulaire ?",
    "options": [
      "La respiration cellulaire",
      "La réplication de l'ADN",
      "La synthèse des protéines",
      "La photosynthèse",
    ],
    "correctAnswerIndex": 2,
  },
].map(Question.fromMap).toList();
