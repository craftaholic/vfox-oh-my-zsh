--- Extension point, called after PreInstall
--- Runs the oh-my-zsh install script
--- @param ctx table
--- @field ctx.rootPath string SDK installation directory
--- @field ctx.version string Version being installed
function PLUGIN:PostInstall(ctx)
  local rootPath = ctx.rootPath
  local installScript = rootPath .. "/install.sh"
  local version = ctx.version

  local cmd = "sh " .. installScript
  local result = os.execute(cmd)

  if result == nil or result ~= 0 then
    error("Failed to run oh-my-zsh install script")
  end
end