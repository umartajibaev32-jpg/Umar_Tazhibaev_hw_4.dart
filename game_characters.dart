
import 'rpg_game.dart';

enum SuperAbility {
  heal,
  boost,
  criticalDamage,
  blockRevert,
  protect,
  dodge,
  sacrifice,
  stun,
}

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  set health(int value) {
    _health = value < 0 ? 0 : value;
  }

  int get health => _health;

  GameCharacter(this.name, this._health, this.damage);

  bool isAlive() {
    return health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    for (Hero h in heroes) {
      if (!h.isAlive()) {
        continue;
      }

      // Lucky has a 25% chance to dodge the attack.
      if (h is Lucky && RpgGame.random.nextInt(100) < 25) {
        print('Lucky ${h.name} dodged the attack!');
        continue;
      }

      int incomingDamage = damage;

      // Berserk blocks part of the damage.
      if (h is Berserk && defence != SuperAbility.blockRevert) {
        int block = (RpgGame.random.nextInt(2) + 1) * 5;
        h.blockedDamage = block;
        incomingDamage -= block;

        if (incomingDamage < 0) {
          incomingDamage = 0;
        }
      }

      // Find a living Golem.
      Golem? golem;

      for (Hero hero in heroes) {
        if (hero is Golem && hero.isAlive()) {
          golem = hero;
          break;
        }
      }

      // Golem protects other heroes by taking 1/5 of their damage.
      if (golem != null && h != golem) {
        int redirectedDamage = incomingDamage ~/ 5;
        int remainingDamage = incomingDamage - redirectedDamage;

        golem.health -= redirectedDamage;
        h.health -= remainingDamage;
      } else {
        h.health -= incomingDamage;
      }
    }
  }

  @override
  String toString() {
    String defenceText = defence == null ? 'No defence' : defence!.name;

    return '${super.toString()} defence: $defenceText';
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

// WARRIOR
class Warrior extends Hero {
  Warrior(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage;
    boss.health -= crit;

    print('Warrior $name hit critically $crit');
  }
}

// MAGIC
class Magic extends Hero {
  Magic(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      for (Hero h in heroes) {
        if (h.isAlive()) {
          int boost = RpgGame.random.nextInt(6) + 5;
          h.damage += boost;
        }
      }

      print("Magic $name increased the team's attack!");
    }
  }
}

// BERSERK
class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (blockedDamage > 0) {
      boss.health -= blockedDamage;
      print('Berserk $name reverted $blockedDamage damage!');
      blockedDamage = 0;
    }
  }
}

// HEALER
class Healer extends Hero {
  int healPoints;

  Healer(String name, int health, int damage, this.healPoints)
      : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }

    print('Healer $name healed the team!');
  }
}

// GOLEM
class Golem extends Hero {
  Golem(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.protect);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    // Golem's protection works inside Boss.attack().
  }
}

// LUCKY
class Lucky extends Hero {
  Lucky(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    // Lucky's dodge works inside Boss.attack().
  }
}

// WITCHER
class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.sacrifice);

  @override
  void attack(Boss boss) {
    // Witcher does not attack the boss.
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive() || hasResurrected) {
      return;
    }

    for (Hero h in heroes) {
      if (!h.isAlive() && h != this) {
        h.health = health;
        health = 0;
        hasResurrected = true;

        print(
          'Witcher $name sacrificed himself to resurrect ${h.name}',
        );

        break;
      }
    }
  }
}

// THOR
class Thor extends Hero {
  Thor(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextInt(100) < 50) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}
