require "constants"
require "commands"

function init_game()
  local turn_number = 0

  -- Grab constants JSON blob
  local raw_constants = io.read()
  load_constants(raw_constants) -- todo need to parse this somehow
