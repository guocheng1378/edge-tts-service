# Edge TTS Service

免费文字转语音服务，基于 Microsoft Edge TTS，兼容 OpenAI API。

## 一键部署到 Render

1. Fork 这个仓库
2. 去 [render.com](https://render.com) 注册，连上 GitHub
3. New → Web Service → 选这个仓库
4. 点 Create，等部署完成
5. 拿到 `https://xxx.onrender.com` 地址

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

返回 MP3 音频流。

## 语音列表

- 中文：`zh-CN-XiaoxiaoNeural`、`zh-CN-YunxiNeural`
- 老挝语：`lo-LA-KeomanyNeural`、`lo-LA-ChanthavongNeural`

更多语音：https://speech.platform.bing.com/consumer/speech/synthesize/readaloud/voices/list?trustedclienttoken=6A5AA1D4EAFF4E9FB37E23D68491D6F4
