
import 'game_characters.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    roundNumber = 0;

    Boss boss = Boss('Dragon', 1000, 50);

    // Existing heroes
    Warrior warrior1 = Warrior('Ahiles', 280, 15);
    Warrior warrior2 = Warrior('Hercules', 290, 10);

    Magic magic = Magic('Strange', 270, 15);

    Berserk berserk = Berserk('Axe', 260, 10);

    Healer doc = Healer('Jake', 250, 5, 15);
    Healer assistant = Healer('Junior', 300, 5, 5);

    // New heroes
    Golem golem = Golem('Rock', 500, 5);
    Lucky lucky = Lucky('Lucky', 250, 12);
    Witcher witcher = Witcher('Geralt', 300, 0);
    Thor thor = Thor('Thor', 350, 20);

    List<Hero> heroes = [
      warrior1,
      doc,
      magic,
      berserk,
      warrior2,
      assistant,
      golem,
      lucky,
      witcher,
      thor,
    ];

    _showStatistics(boss, heroes);

    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('\nROUND $roundNumber =========================');
    print(boss);

    for (Hero h in heroes) {
      print(h);
    }
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;

    boss.chooseDefence();

    // Boss skips his attack if Thor stunned him.
    if (boss.isStunned) {
      print('Boss is stunned and skips this round!');
      boss.isStunned = false;
    } else {
      boss.attack(heroes);
    }

    for (Hero h in heroes) {
      if (h.isAlive() && boss.isAlive() && h.ability != boss.defence) {
        h.attack(boss);
        h.applySuperPower(boss, heroes);
      }
    }

    _showStatistics(boss, heroes);
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('\nHeroes won!!!!');
      return true;
    }

    bool allHeroesDead = true;

    for (Hero h in heroes) {
      if (h.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }

    if (allHeroesDead) {
      print('\nBoss won!!!');
      return true;
    }

    return false;
  }

  static void startGameWrapper() {
    startGame();
  }
}
