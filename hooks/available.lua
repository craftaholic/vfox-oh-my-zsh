local constants = require("constants")

--- Return all available versions provided by this plugin
--- @param ctx table Empty table used as context, for future extension
--- @return table Array of available versions with metadata
function PLUGIN:Available(ctx)
  return constants.VERSIONS, nil
end
