--- Extension point, called after PreInstall
--- Runs the oh-my-zsh install script from fork
--- @param ctx table
--- @field ctx.rootPath string SDK installation directory
--- @field ctx.version string Version being installed
function PLUGIN:PostInstall(ctx)
  local constants = require("constants")
  local homeDir = os.getenv("HOME")
  local ohMyZshDir = homeDir .. "/.oh-my-zsh"
  local installUrl = constants.INSTALL_SCRIPT_URL

  os.execute("rm -rf " .. ohMyZshDir .. " 2>/dev/null || true")

  os.execute("REPO=craftaholic/ohmyzsh curl -fsSL " .. installUrl .. " | sh /dev/stdin --unattended --keep-zshrc </dev/null")

  os.execute("rm -f /tmp/vfox-ohmyzsh-install.sh 2>/dev/null || true")

  print("Installed oh-my-zsh from craftaholic/ohmyzsh fork")
end
