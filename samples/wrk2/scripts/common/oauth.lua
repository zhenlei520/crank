local util = require("./scripts/common/util")

oAuthPathArray = {"OpenId=o5owN5K_RJjGHtU-HQthQoR9yp-U&Phone=17557289603"}

oAuthPath = "/api/Account/GetToken?"

local _oauth = {}

function _oauth.request()
    local localPath = nil
    if (wrk.port == nil) then
        localPath = oAuthPath .. util.random(oAuthPathArray)
    else
        localPath = oAuthPath .. util.random(oAuthPathArray)
    end
    return wrk.format("GET", localPath)
end

return _oauth