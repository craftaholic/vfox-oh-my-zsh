--- Extension point, called after PreInstall
--- Runs the oh-my-zsh install script
--- @param ctx table
--- @field ctx.rootPath string SDK installation directory
--- @field ctx.version string Version being installed
function PLUGIN:PostInstall(ctx)
  local rootPath = ctx.rootPath
  local installScript = rootPath .. "/install.sh"
  local homeDir = os.getenv("HOME")
  local ohMyZshDir = homeDir .. "/.oh-my-zsh"

  os.execute("rm -rf " .. ohMyZshDir .. " 2>/dev/null || true")

  local installResult = os.execute("sh " .. installScript .. " --unattended --keep-zshrc")

  if installResult == nil or installResult ~= 0 then
    error("Failed to run oh-my-zsh install script")
  end
end

