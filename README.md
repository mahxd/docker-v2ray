### 使用 docker-compose 部署 v2ray(Vmess + TLS + WebSocket)

---

克隆本项目到服务器上后，进入 `docker-vray` 目录，执行 `bash start-v2ray.sh` 命令即可

若要使用其它路径，请在运行 `start-v2ray.sh` 脚本<b>前</b>修改 `data/nginx/conf.d/v2ray.conf` 中的 `/HelloWorld` 字符串

若未安装 Docker 或 docker-compose，请在运行 `start-v2ray.sh` 脚本<b>前</b>执行 `bash install-docker.sh` 命令

若未开启TCP加速，请在运行 `start-v2ray.sh` 脚本<b>后</b>执行 `bash install-bbr.sh` 命令（服务器可能会自动重启）

