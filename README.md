# Edge TTS Service

免费文字转语音服务，基于 Microsoft Edge TTS，兼容 OpenAI API。

## 飞牛 NAS 部署（一键）

### 方法一：Docker Compose

1. 打开飞牛 NAS 的 **Docker** 应用
2. 新建项目，名称填 `edge-tts`
3. 把下面的内容粘贴进去：

```yaml
version: "3"
services:
  edge-tts:
    image: travisvn/openai-edge-tts:latest
    container_name: edge-tts
    restart: always
    ports:
      - "5050:5050"
    environment:
      - PORT=5050
      - API_KEY=
      - REQUIRE_API_KEY=False
      - DEFAULT_VOICE=zh-CN-XiaoxiaoNeural
      - DEFAULT_RESPONSE_FORMAT=mp3
```

4. 点 **启动**
5. 等待拉取镜像完成

### 方法二：Docker 命令

如果你有 SSH 终端：

```bash
docker run -d --name edge-tts --restart always -p 5050:5050 \
  -e PORT=5050 \
  -e REQUIRE_API_KEY=False \
  travisvn/openai-edge-tts:latest
```

### 验证

启动后在浏览器访问：
```
http://你的NAS内网IP:5050/v1/audio/speech
```

### 外网访问

部署好后，把 NAS 的 5050 端口映射到公网（路由器端口转发），
然后把 app 里的地址改成：
```
http://你的公网IP:5050/v1/audio/speech
```

或者用 NAS 自带的内网穿透功能。

## API

```
POST /v1/audio/speech
Content-Type: application/json

{
  "input": "你好世界",
  "voice": "zh-CN-XiaoxiaoNeural",
  "response_format": "mp3"
}
```

## 语音列表

| 语言 | 语音名 |
|------|--------|
| 中文（女声） | zh-CN-XiaoxiaoNeural |
| 中文（男声） | zh-CN-YunxiNeural |
| 老挝语 | lo-LA-KeomanyNeural |
