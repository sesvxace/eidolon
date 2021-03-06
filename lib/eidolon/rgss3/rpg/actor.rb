require 'eidolon/rgss3/rpg/base_item'

module RPG
  # == RGSS3
  # This data structure is specific to RGSS3 (VX Ace).
  # 
  # == Actor
  # The data class for actors.
  class Actor < BaseItem
    attr_accessor :nickname
    attr_accessor :class_id
    attr_accessor :initial_level
    attr_accessor :max_level
    attr_accessor :equips
    attr_accessor :character_name
    attr_accessor :character_index
    attr_accessor :face_name
    attr_accessor :face_index
  end
end