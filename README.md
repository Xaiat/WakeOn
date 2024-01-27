# WakeOn
<!--
WakeOn is a software program capable of awakening a target computer through a command executed within a local area network. Additionally, it can detect if the target computer has finished booting up and ascertain the readiness of specific ports.
WakeOn 是一个能够通过在局域网内执行命令来唤醒目标电脑的软件程序。此外，它还能检测目标电脑是否已完成启动，并确定特定端口的准备就绪状态。
-->

<!-- 
WakeOn is a software program capable of awakening a target computer through a command executed
within a local area network. Additionally, it can detect if the target computer has finished booting up
and ascertain the readiness of specific ports.
WakeOn 是一个能够通过在局域网内执行命令来唤醒目标电脑的软件程序。此外，它还能检测目标电脑是否已完
成启动，并确定特定端口的准备就绪状态。
Font: Merriweather
Font size: 30
Font color: #000000FF
Multiline: Each sentence on a new line
Width ✕ Height: 1500 ✕ 185
https://readme-typing-svg.herokuapp.com/demo/
-->

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Merriweather&size=30&pause=1000&color=000000&multiline=true&random=false&width=1500&height=200&lines=WakeOn+is+a+software+program+capable+of+awakening+a+target+computer+through+a+command+executed;within+a+local+area+network.+Additionally%2C+it+can+detect+if+the+target+computer+has+finished+booting+up;and+ascertain+the+readiness+of+specific+ports.;WakeOn+%E6%98%AF%E4%B8%80%E4%B8%AA%E8%83%BD%E5%A4%9F%E9%80%9A%E8%BF%87%E5%9C%A8%E5%B1%80%E5%9F%9F%E7%BD%91%E5%86%85%E6%89%A7%E8%A1%8C%E5%91%BD%E4%BB%A4%E6%9D%A5%E5%94%A4%E9%86%92%E7%9B%AE%E6%A0%87%E7%94%B5%E8%84%91%E7%9A%84%E8%BD%AF%E4%BB%B6%E7%A8%8B%E5%BA%8F%E3%80%82%E6%AD%A4%E5%A4%96%EF%BC%8C%E5%AE%83%E8%BF%98%E8%83%BD%E6%A3%80%E6%B5%8B%E7%9B%AE%E6%A0%87%E7%94%B5%E8%84%91%E6%98%AF%E5%90%A6%E5%B7%B2%E5%AE%8C;%E6%88%90%E5%90%AF%E5%8A%A8%EF%BC%8C%E5%B9%B6%E7%A1%AE%E5%AE%9A%E7%89%B9%E5%AE%9A%E7%AB%AF%E5%8F%A3%E7%9A%84%E5%87%86%E5%A4%87%E5%B0%B1%E7%BB%AA%E7%8A%B6%E6%80%81%E3%80%82)](https://www.xaiat.com)
## Example: Wake On LAN for 14900k-1517 Workstation

![Wake On LAN for 14900k-1517](./assets/Wake-On-LAN-for-14900k-1517.gif)
*Wake On LAN for 14900k-1517.*

![Albuquerque, New Mexico](https://mdg.imgix.net/assets/images/albuquerque.jpg)
*A single track trail outside of Albuquerque, New Mexico.*

![The San Juan Mountains are beautiful!](https://mdg.imgix.net/assets/images/san-juan-mountains.jpg "San Juan Mountains")

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!|
```

# 1.==== Create a New Script ====
The example path:
/Users/rolex/Code/WakeOn/WOL-14900k-1517.sh

```console
mkdir /Users/rolex/Code/WakeOn/
vim /Users/rolex/Code/WakeOn/WOL-14900k-1517.sh
```
```sh
#!/bin/bash

# 1. Wake up the device using wakeonlan
# 1. 使用 wakeonlan 唤醒设备
echo "==== Step 1/3 Wake On ===="
wakeonlan 58:11:22:d8:21:e3

# 2. Ping 192.168.1.15 and wait for the network response
# 2. Ping 192.168.1.15，并等待网络响应
echo "==== Step 2/3 Ping ===="
counter=0
start_time=$(date +%s)
while ! ping -c 1 192.168.1.15 &> /dev/null; do
    now=$(date +%s)
    counter=$((now - start_time))
    # Print waiting message without generating new lines, showing elapsed time in seconds
    # 打印等待消息，不产生新行，并显示经过的时间（秒）
    printf "\rWaiting for device 192.168.1.15 to respond... 等待设备 192.168.1.15 响应... %d" "$counter"
    sleep 1
done

# Move to a new line after the loop finishes
# 在循环结束后换行
printf "\n"

# Print response confirmation message
# 打印响应确认消息
echo "Device 192.168.1.15 has responded"
echo "设备 192.168.1.15 已响应"

# 3. Check if port 22 is open for SSH connection
# 3. 检测端口 22 是否开放，用于 SSH 连接
echo "==== Step 3/3 Check Port 22 ===="
counter=0
while true; do
    # Increment counter at the start of each loop
    # 在每次循环开始时增加计数器
    counter=$((counter+1))
    # Print waiting message without generating new lines, showing elapsed time in seconds
    # 打印等待消息，不产生新行，并显示经过的时间（秒）
    printf "\rWaiting for port 22 to open... 等待端口 22 开放... %d" "$counter"

    if nc -z 192.168.1.15 22; then
        # When connection succeeds, move to a new line and break the loop
        # 当连接成功时，换行并跳出循环
        printf "\n"
        break
    fi
    sleep 1
done

# Flash a message on the screen and make a sound when port 22 is open
# 当端口 22 开放时，在屏幕上发出闪烁提示，并发出声音提示
echo -e "\033[5mPort 22 is open!\033[0m"
echo -e "\033[5m端口 22 已开放!\033[0m"

# Make a sound alert
# 发出声音提示
echo -e "\a"

# Use other methods to make a sound if your terminal supports it
# 如果你的终端支持，也可以使用其他方式发出声音
# For example, `osascript -e 'beep'` for macOS
# 如：osascript -e 'beep'  # 仅适用于 macOS
# Or use any available command-line audio player to play a specific sound file
# 或使用任何可用的命令行音频播放工具播放特定的声音文件
```
# 2. ==== Permissions Command ====
```console
chmod +x /Users/rolex/Code/WakeOn/WOL-14900k-1517.sh
```
# 3. ==== Create a Symbolic Link ====
```console
sudo ln -s /Users/rolex/Code/WakeOn/WOL-14900k-1517.sh /usr/local/bin/WOL-14900k
```
# 4. ==== Use Script ====
```console
WOL-14900k
```
