-- Really stupid simple loading of secrets into `hs.settings`.
-- Example:
-- Secrets = require("secrets")
-- -- Expect secrets file to contain json table data. i.e. { "p": "SecretPassCode!¡" }
-- local secrets = hs.settings.get("secrets")["p"]

module = {}

module.start = function()
  local filename = ".secrets.json"
  if hs.fs.attributes(filename) then
    hs.settings.set("secrets", hs.json.read(filename))
  else
    HammerLog.i("You need to create a file at " .. filename)
  end
end

return module
