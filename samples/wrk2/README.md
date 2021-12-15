## README


仅需要get请求，可不操作lua脚本、参考orderDetail2文件即可，仅需要改动yml脚本，不需要改动其他配置，Agent代理机为8号机

lua脚本相关：

如果需要改动Lua脚本，则改完Lua脚本后需要把scripts压缩为tar文件后上传到gitlab后再进行压测

scripts文件夹下为lua脚本，common文件夹下为公共脚本，util文件是公共类库，提供常用方法

如果需要测试post或者put请求，或者多用户、则需要新建lua脚本，改完lua脚本后需要预缩为tar文件（仅支持tar，建议使用7zip压缩）