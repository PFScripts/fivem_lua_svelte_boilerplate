---@param data NUI_DATA
local function handleNui(data)
  local focus = data?.focus
  if type(focus) == 'boolean' then SetNuiFocus(focus, focus) end
  local message = data?.message
  if not type(message) == 'table' then return end
  SendNUIMessage(message)
end

---@param body any
---@param resultCallback function
local function hideUI(body, resultCallback)
  handleNui({message = body, focus = false})
  resultCallback(true)
end

RegisterNUICallback('hideUI', hideUI)

return handleNui