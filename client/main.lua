local handleNui = require('client.modules.handleNui')

local function openCounter()
  local data = {message = {action = 'setVisibleCounter', data = true}, focus = true}
  handleNui(data)
end

RegisterCommand('openCounter', openCounter)