local _test = require("./scripts/common/test")
local util = require("./scripts/common/util")

-- paramArray = {'spu=17211200025&activeType=8&sourceId=f7da65b1-bf19-429a-92c8-a798f33d1844'}
paramType = 0 -- 0是根据传递过来的参数随机、1是依次递增
index = 1
paramArrayLength = 0
queryParam = nil
queryPath = nil

newParamArray = nil
responseIndex = 0 

token = nil

function init(args)
    print('wrk init')

    print('args length is ' .. util.length(args))

    queryPath = wrk.path

    print('old path: ' .. queryPath)

    if util.length(args) > 0 then

        newParamArray = {}
        util.forEach(args, function(i, v)
            if i == 1 then
                paramType = v
            elseif i == 2 then
                print('queryParam1 : ' .. v)

                queryParam = util.replace(v,'\'','')
                print('queryParam2 : ' .. queryParam)
            elseif i > 2 then
                local path = queryParam
                util.forEach(util.split(v, '|'), function(k, v2)
                    path = util.replace(path, '{' .. k .. '}', v2)
                end)
                path = util.replace(path,'\'','')
                
                print('address : ' .. path)
                newParamArray[i - 2] = path
            end
        end)
    end
    paramArrayLength = util.length(newParamArray)
    print('new path length is ' .. paramArrayLength)
end

request = function()
    -- print('request ---------')

    if not token then
        -- print('oauth ---------')
        return _test.request()
    else
        -- print('no oauth ---------')
        local path = nil
        if paramType == '0' then

            path = util.random(newParamArray)
            path = queryPath .. path
            -- print('random request2 --------- .. ' .. path)
            return wrk.format("GET", path)
        else
            path = newParamArray[index]
            index = index + 1
            if index > paramArrayLength then
                index = 1
            end
            return wrk.format("GET", queryPath .. path)
        end
    end
end

response = function(status, headers, body)
    if not token and status == 200 then
        token = body
        wrk.headers["Authorization"] = 'Bearer ' .. token
    end
end
