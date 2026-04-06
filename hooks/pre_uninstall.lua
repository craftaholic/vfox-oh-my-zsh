local constants = require("constants")

--- This is called before SDK is uninstalled.
--- @param ctx table Context information
--- @field ctx.main table Main SDK info
function PLUGIN:PreUninstall(ctx)
  local rootPath = ctx.main.path
  local version = ctx.main.version

  local home = os.getenv("HOME")
  local ohMyZshPath = home .. "/.oh-my-zsh"

  if io.open(ohMyZshPath, "r") then
    local result = os.execute('rm -rf "' .. ohMyZshPath .. '"')
    print("Removed " .. ohMyZshPath)
  end

  print("Uninstalled oh-my-zsh")
end