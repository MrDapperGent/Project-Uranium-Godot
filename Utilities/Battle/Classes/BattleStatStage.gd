extends Object
class_name BattleStatStage

# Limits: +6 to -6
var attack = 0
var defense = 0
var sp_attack = 0
var sp_defense = 0
var speed = 0
var accuracy = 0
var evasion = 0
var evasion_multiplier = 1.0 # Should be 1.0 most of the time. Be 0.0 when poke is invunrable by fly, dig, etc.

enum {
    ATTACK,
    DEFENSE,
    SP_ATTACK,
    SP_DEFENSE,
    SPEED,
    ACCURACY,
    EVASION
}

static func get_multiplier(stat: int) -> float:
    match stat:
        -6:
            return 0.25
        -5:
            return 2.0 / 7.0
        -4:
            return 1.0/ 3.0
        -3:
            return 2.0 / 5.0
        -2:
            return 0.5
        -1:
            return 2.0 / 3.0
        0:
            return 1.0
        1:
            return 3.0 / 2.0
        2:
            return 2.0
        3:
            return 5.0 / 2.0
        4:
            return 3.0
        5:
            return 7.0 / 2.0
        6:
            return 4.0
        _:
            print("Battle Error: Stage Stat is over limits!")
            return 1.0
    pass
func apply_stat_effect(effect : StatStageEffect):
    attack += effect.attack
    defense += effect.defense
    sp_attack += effect.sp_attack
    sp_defense += effect.sp_defense
    speed += effect.speed
    accuracy += effect.accuracy
    evasion += effect.evasion

    var over_limit = false
    if attack > 6:
        attack = 6
        over_limit = true
    if attack < -6:
        attack = -6
        over_limit = true
    if defense > 6:
        defense = 6
        over_limit = true
    if defense < -6:
        defense = -6
        over_limit = true
    if sp_attack > 6:
        sp_attack = 6
        over_limit = true
    if sp_attack < -6:
        sp_attack = -6
        over_limit = true
    if sp_defense > 6:
        sp_defense = 6
        over_limit = true
    if sp_defense < -6:
        sp_defense = -6
        over_limit = true
    if speed > 6:
        speed = 6
        over_limit = true
    if speed < -6:
        speed = -6
        over_limit = true
    if accuracy > 6:
        accuracy = 6
        over_limit = true
    if accuracy < -6:
        accuracy = -6
        over_limit = true
    if evasion > 6:
        evasion = 6
        over_limit = true
    if evasion < -6:
        evasion = -6
        over_limit = true

    var stats_changed = []
    
    if effect.attack != 0:
        stats_changed.push_back(ATTACK)
    if effect.defense != 0:
        stats_changed.push_back(DEFENSE)
    if effect.sp_attack != 0:
        stats_changed.push_back(SP_ATTACK)
    if effect.sp_defense != 0:
        stats_changed.push_back(SP_DEFENSE)
    if effect.speed != 0:
        stats_changed.push_back(SPEED)
    if effect.accuracy != 0:
        stats_changed.push_back(ACCURACY)
    if effect.evasion != 0:
        stats_changed.push_back(EVASION)

    return stats_changed