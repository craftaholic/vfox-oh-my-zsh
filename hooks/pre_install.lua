local constants = require("constants")

--- Returns pre-installation information such as version, download URL, checksum
--- @param ctx table
--- @field ctx.version string User-input version
--- @return table Version information
function PLUGIN:PreInstall(ctx)
  local version = ctx.version

  local versionInfo = nil
  for _, v in ipairs(constants.VERSIONS) do
    if v.version == version then
      versionInfo = v
      break
    end
  end

  if not versionInfo then
    return nil, "Version not found: " .. version
  end

  local installUrl = constants.OHMYZSH_BASE_URL .. "/" .. versionInfo.commit .. "/tools/install.sh"

  return {
    version = version,
    url = installUrl,
    sha256 = versionInfo.sha256,
    note = "Installing oh-my-zsh " .. version,
  }
end
