# 使用青龙面板的官方镜像
FROM whyour/qinglong:latest

# 设置工作目录
WORKDIR /ql

# 设置环境变量
ENV NODE_ENV=production
ENV QL_DB_TYPE=sqlite3  # 根据需要选择数据库类型
# 其他必要的环境变量，可以根据实际情况添加

# 暴露青龙面板使用的端口
EXPOSE 5700

# 启动青龙面板
CMD ["start.sh"]
