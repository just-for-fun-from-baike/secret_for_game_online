# secret_for_game_online

程序员的表白神器，搞鬼游戏，...，你可以用来做你想做的事

脚本的功能：将一段话的每一句作为下一句话的链接，构成循环，并在最后一句话的源代码中藏入真正的秘密的链接

## 安装所需组件

`sudo apt install pandoc`

## 生成

- 将`./secret/secrets/create-secret`文件中的内容改为自己想让别人看到的一段话
- 将脚本`./secret/secrets/create.sh`中的`爱你`改为想藏起来的内容
- 而后运行该命令`./secret/secrets/create.sh`即可生成主页`./secret/index.html`
    - 注意给`./secret/secrets/create.sh`加执行权限


## 测试

将`./secret/index.html`在浏览器中打开查看效果
