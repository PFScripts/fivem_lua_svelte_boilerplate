---@param data NUI_DATA
local function handleNui(data)
  local message = data?.message
  local focus = data?.focus
  if not type(message) == 'table' then return end
  if focus and type(focus) == 'boolean' then SetNuiFocus(focus, focus) end
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