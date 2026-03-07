#!/bin/bash
# 魔搭创空间启动脚本
# 使用 gunicorn + uvicorn worker 启动 FastAPI 应用

cd /app

# 导出环境变量（如果 .env 存在就加载）
if [ -f backend/.env ]; then
  export $(grep -v '^#' backend/.env | xargs)
fi

echo "🚀 启动旅途星辰 AI 旅行助手..."
echo "   端口: 7860"
echo "   工作目录: $(pwd)"

exec gunicorn backend.app.api.main:app \
  --bind 0.0.0.0:7860 \
  --workers 1 \
  --worker-class uvicorn.workers.UvicornWorker \
  --timeout 600 \
  --access-logfile - \
  --error-logfile -
