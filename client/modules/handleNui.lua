---@param data NUI_DATA
local function handleNui(data)
  local message = data?.message
  local focus = data?.focus
  if not type(message) == 'table' or not type(focus) == 'boolean' then return end
  SetNuiFocus(focus, focus)
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