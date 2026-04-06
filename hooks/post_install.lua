--- Extension point, called after PreInstall
--- Runs the oh-my-zsh install script from fork
--- @param ctx table
--- @field ctx.rootPath string SDK installation directory
--- @field ctx.version string Version being installed
function PLUGIN:PostInstall(ctx)
  local homeDir = os.getenv("HOME")
  local ohMyZshDir = homeDir .. "/.oh-my-zsh"
  local rootPath = ctx.rootPath
  local installScript = rootPath .. "/install.sh"

  print("Removing existing oh-my-zsh installation...")
  os.execute("rm -rf " .. ohMyZshDir .. " 2>/dev/null || true")

  print("Running oh-my-zsh install script...")
  local installResult = os.execute("sh " .. installScript .. " --unattended --keep-zshrc")

  if installResult == nil or installResult ~= 0 then
    error("Failed to run oh-my-zsh install script")
  end

  print("Installed oh-my-zsh from craftaholic/ohmyzsh fork")
end
