--- Extension point, called after PreInstall
--- Runs the oh-my-zsh install script
--- @param ctx table
--- @field ctx.rootPath string SDK installation directory
--- @field ctx.version string Version being installed
function PLUGIN:PostInstall(ctx)
  local rootPath = ctx.rootPath
  local installScript = rootPath .. "/install.sh"
  local version = ctx.version

  -- remove old ~/.oh-my-zsh if it exists
  local homeDir = os.getenv("HOME")
  local ohMyZshDir = homeDir .. "/.oh-my-zsh"
  os.execute("rm -rf " .. ohMyZshDir)

  -- run the install script

  local cmd = "sh " .. installScript
  local result = os.execute(cmd)

  if result == nil or result ~= 0 then
    error("Failed to run oh-my-zsh install script")
  end
end

