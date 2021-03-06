require 'eidolon/rgss/rpg/enemy'

module RPG
  class Enemy
    # == RGSS
    # This data structure is specific to RGSS (XP).
    # 
    # == Action
    # Data class for an enemy action in battle.
    class Action
      attr_accessor :kind
      attr_accessor :basic
      attr_accessor :skill_id
      attr_accessor :condition_turn_a
      attr_accessor :condition_turn_b
      attr_accessor :condition_hp
      attr_accessor :condition_level
      attr_accessor :condition_switch_id
      attr_accessor :rating
    end
  end
end