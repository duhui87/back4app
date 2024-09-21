# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /ql

# Install dependencies
RUN set -x \
    && apk update \
    && apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev g++ py3-pip jpeg-dev pango-dev giflib-dev make \
    && python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --no-cache-dir user-agent cache agent aiohttp jieba ping3 requests canvas \
    && npm install -g ds moment cache index uuid axios js-base64 typescript require @types/node png-js global-agent json5 form-data fs jieba ts-md5 ws tslib tough-cookie date-fns dotenv prettytable crypto-js canvas jsdom hp

# Ensure the virtual environment is activated
ENV PATH="/opt/venv/bin:$PATH"

# Copy the current directory contents into the container at /ql
COPY . /ql

# Make port 8080 available to the world outside this container
EXPOSE 5700

# Run the app when the container launches
CMD ["node", "app.js"]
