FROM whyour/qinglong:latest

WORKDIR /ql

# 更新并安装必要的系统包
RUN set -x && \
    apk update && \
    apk add --no-cache \
    gcc musl-dev python3-dev libffi-dev openssl-dev g++ py-pip \
    jpeg-dev pango-dev giflib-dev && \
    pip install --no-cache-dir \
    user-agent cache agent aiohttp jieba ping3 requests canvas && \
    npm install -g \
    ds moment cache index uuid axios js-base64 typescript require @types/node \
    png-js global-agent json5 form-data fs jieba ts-md5 ws tslib tough-cookie \
    date-fns dotenv prettytable crypto-js canvas jsdom hp

# 清理不必要的缓存和开发包
RUN apk del gcc musl-dev python3-dev libffi-dev openssl-dev g++ && \
    rm -rf /var/cache/apk/* /root/.npm /root/.cache
