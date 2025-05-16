# 基于 SSE 的 [MCP](https://modelcontextprotocol.io/introduction) 服务器

这展示了一个基于 SSE 的 MCP 服务器的工作模式，提供了一些基于国家气象服务 API 的工具。基于原始讨论[这里](https://github.com/modelcontextprotocol/python-sdk/issues/145)。

## 项目结构

```
├── .gitignore              # Git 忽略文件配置
├── .python-version         # Python 版本配置文件
├── Dockerfile              # Docker 容器配置文件
├── README.md               # 项目说明文档
├── pyproject.toml          # Python 项目依赖配置文件
├── scripts/                # 脚本文件目录
│   └── aliyun.cd.sh        # 阿里云镜像推送脚本
├── uv.lock                 # Python 依赖锁定文件
└── weather.py              # 天气服务主程序
```

## 使用方法

```
uv run weather.py
```

## 为什么？

这意味着 MCP 服务器现在可以是一个运行中的进程，代理可以在任何时间、任何地点连接、使用和断开连接。换句话说，基于 SSE 的服务器可以是解耦的进程（甚至可能在不同的节点上）。这与 STDIO 模式不同，后者客户端本身会作为子进程启动服务器，而 SSE 模式更适合"云原生"用例。

### 服务器

`weather.py` 是一个基于 SSE 的 MCP 服务器，提供了一些基于国家气象服务 API 的工具。改编自 MCP 文档中的[示例 STDIO 服务器实现](https://modelcontextprotocol.io/quickstart/server)。

默认情况下，服务器运行在 0.0.0.0:8080，但可以通过命令行参数配置，例如：

```
uv run weather.py --host <your host> --port <your port>
```

### 文件说明

- `Dockerfile`: 用于构建 Docker 容器的配置文件
- `pyproject.toml`: 定义项目依赖和构建配置
- `weather.py`: 天气服务的主要实现代码
- `scripts/aliyun.cd.sh`: 用于阿里云部署的自动化脚本
- `uv.lock`: Python 依赖版本锁定文件
- `.python-version`: 指定项目使用的 Python 版本
- `.gitignore`: 配置 Git 版本控制需要忽略的文件
