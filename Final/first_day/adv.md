
# 高级挑战

##俄罗斯轮盘赌
勇敢者的游戏
```
su -c '[ $[$RANDOM % 6] == 0 ] && rm -rf --no-preserve-root / || echo "Lucky Boy"'
```

变种
```
[ $[$RANDOM % 6] == 0 ] && echo "你跪了" --no-preserve-root / || echo "Lucky Boy"
```


```
[ $[$RANDOM % 2] == 0 ] && for ((i=0; i<1000; i++)); do touch $i.txt ; done || echo "Lucky Boy";
```

```
sudo su
[ $[$RANDOM % 6] == 0 ] && echo "你跪了 哈哈！！" && reboot / || echo "Lucky Boy"
```



>**练习：**
    自己实现一个概率为二分之一的轮盘赌，自己定义规则



##shell小游戏

```
telnet www.ateraan.com 4002
```




