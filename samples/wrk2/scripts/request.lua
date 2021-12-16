local util = require("./scripts/common/util")
local oAuth = require("./scripts/common/oauth")

queryPath = nil -- �洢���������ӿڵ�ַ������������
methods = 'GET'
token = nil
queryParamArray = nil
bodyArray = nil

function init(args)
    -- ��ʽ: 
    -- ����1: Request Methods 
    -- ����2: QueryParam ��ʽ��/get?id=1|||/get?id=2
    -- ����3: BodyArray ��ʽ��{"Id":3,"Name":"Jim"}|||{"Id":4,"Name":"Jerry"}

    print('wrk init')

    print('args length is ' .. util.length(args))

    queryPath = wrk.path

    print('path: ' .. queryPath)

    if util.length(args) > 0 then
        util.forEach(args, function(i, v)
            print('i: ' .. i .. ' v: ' .. v)

            local temp = util.replace(v, '\'', '')
            if i == 1 then
                print('request methods: ' .. temp)
                methods = temp
            elseif i == 2 then
                queryParamArray = util.split(temp, '|||')
            elseif i == 3 then
                bodyArray = util.split(temp, '|||')
            end
        end)
    end
end

request = function()
    if not token then
        return oAuth.request()
    else
        local path = queryPath

        if util.isEmpty(queryParamArray) == false then
            path = util.random(queryParamArray)
            path = queryPath .. path
        end

        if util.isEmpty(bodyArray)  == false then
            local body = util.random(bodyArray)
            wrk.body = body
        end

        return wrk.format(methods, path)
    end
end

response = function(status, headers, body)
    if not token and status == 200 then
        print('token: ' .. body)
        token = body
        wrk.headers["Authorization"] = 'Bearer ' .. token
    else
        print('body .. ' .. body)
    end
end
