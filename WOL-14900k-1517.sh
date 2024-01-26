#!/bin/bash

# 1. Wake up the device using wakeonlan
# 1. 使用 wakeonlan 唤醒设备
echo "==== Step 1/3 Wake On ===="
wakeonlan 58:11:22:d8:21:e3

# 2. Ping 192.168.1.15 and wait for the network response
# 2. Ping 192.168.1.15，并等待网络响应
echo "==== Step 2/3 Ping ===="
# This variable keeps track of the counter value.
# 这个 counter 变量用于跟踪计数器的值。
counter=0
# This variable keeps track of the start time.
# 这个 start_time 变量用于跟踪开始时间。
start_time=$(date +%s)
# This loop will run until the device responds to ping.
# 这个循环将一直运行，直到设备响应 ping。
while ! ping -c 1 192.168.1.15 &> /dev/null; do
    # Increment counter at the start of each loop
    # 在每次循环开始时增加计数器
    now=$(date +%s)
    # Calculate the elapsed time in seconds
    # 计算经过的时间（秒）
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
# This variable keeps track of the counter value.
# 这个 counter 变量用于跟踪计数器的值。
counter=0
# This loop will run until port 22 is open.
# 这个循环将一直运行，直到端口 22 开放。
while ! nc -z 192.168.1.15 22; do
    # Increment counter at the start of each loop
    # 在每次循环开始时增加计数器
    counter=$((counter+1))
    # Print waiting message without generating new lines, showing elapsed time in seconds
    # 打印等待消息，不产生新行，并显示经过的时间（秒）
    printf "\rWaiting for port 22 to open... 等待端口 22 开放... %d" "$counter"
    sleep 1
done

# Move to a new line after the loop finishes to separate the connection success message
# 在循环结束后换行，以便于将连接成功的消息单独显示
printf "\n"

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