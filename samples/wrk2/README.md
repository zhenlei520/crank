## 目录结构

``` 目录结构
Crank
├── benchmarks                压测脚本
│   ├── api                   接口压测脚本               
│   │   ├── add               
│   │   └── get                  
│   ├── scripts               lua脚本             
│   │   ├── common            lua公共脚本
│   │   │   ├── oauth.lua     认证lua脚本
│   │   │   ├── util.lua      lua工具类脚本
│   │   ├── request.lua       封装请求lua脚本   
│   ├── scripts.tar           lua脚本压缩包
├── common                            
│   ├── load.profiles.yml     agent 负载机配置
│   ├── project.profiles.yml  项目配置
│   ├── scripts.profiles      crank 执行script配置，用于对输出结果的二次处理
│   ├── project.profiles.yml  项目配置
├── scripts                   场景压测脚本
│   ├── home.bat              首页压测     
└── env                       环境配置，标记当前需要压测的环境在哪个配置文件中存储
└── env.local                 本地环境，存储本地环境的配置信息
└── README.md                 帮助文档
```

