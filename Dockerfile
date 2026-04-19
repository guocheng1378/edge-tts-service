FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

ENV PORT=10000
ENV API_KEY=
ENV REQUIRE_API_KEY=False
ENV DEFAULT_VOICE=zh-CN-XiaoxiaoNeural
ENV DEFAULT_RESPONSE_FORMAT=mp3
ENV DEFAULT_SPEED=1.0

EXPOSE 10000

CMD ["python", "server.py"]
