local util = require("./scripts/common/util")

queryPath = nil -- �洢���������ӿڵ�ַ������������
methods = 'GET'
token = nil
queryParamArray = nil
bodyArray = nil

function init(args)
    -- ��ʽ: 
    -- ����1: Request Methods 
    -- ����2: Authorization 
    -- ����3: QueryParam ��ʽ��/get?id=1|||/get?id=2
    -- ����4: BodyArray ��ʽ��{"Id":3,"Name":"Jim"}|||{"Id":4,"Name":"Jerry"}

    print('wrk init')

    print('args length is ' .. util.length(args))

    queryPath = wrk.path

    print('old path: ' .. queryPath)

    if util.length(args) > 0 then
        util.forEach(args, function(i, v)
            local temp = util.replace(v, '\'', '')
            if util.isEmpty(temp) == false then
                if i == 1 then
                    print('request methods: ' .. temp)
                    methods = temp
                elseif i == 2 then
                    print('Authorization : ' .. temp)
                    wrk.headers["Authorization"] = 'Bearer ' .. temp
                elseif i == 3 then
                    queryParamArray = util.split(temp, '|||')
                elseif i == 4 then
                    bodyArray = util.split(temp, '|||')
                end
            end
        end)
    end
end

request = function()
    local path = queryPath

    if util.isEmpty(queryParamArray) then
        path = util.random(queryParamArray)
        path = queryPath .. path
    end

    if util.isEmpty(bodyArray) then
        local body = util.random(bodyArray)
        wrk.body = body
    end

    return wrk.format(methods, path)
end
