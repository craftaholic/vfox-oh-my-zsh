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

  return {
    version = version,
    url = versionInfo.url,
    note = "Installing oh-my-zsh " .. version,
  }
end
