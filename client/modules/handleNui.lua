---@param data NUI_DATA
local function handleNui(data)
  local focus = data?.focus
  if type(focus) == 'boolean' then SetNuiFocus(focus, focus) end
  local message = data?.message
  if not type(message) == 'table' then return end
  SendNUIMessage(message)
end

---@param message any
---@param cb function
local function hideUI(message, cb)
  handleNui({message = message, focus = false})
  cb(true)
end

---@param str string
---@param cb function
local function getLocaleConvar(str, cb)
  cb(locale(str))
end

RegisterNUICallback('hideUI', hideUI)
RegisterNUICallback('getLocale', getLocaleConvar)



return handleNui