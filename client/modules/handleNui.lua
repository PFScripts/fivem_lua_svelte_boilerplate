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
local function hideComponent(body, resultCallback)
  local data = {message = body, focus = false}
  handleNui(data)
  resultCallback(true)
end

RegisterNUICallback('hideComponent', hideComponent)

return handleNui