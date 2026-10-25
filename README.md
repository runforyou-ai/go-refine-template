# go-refine-template

Go 单二进制 + Refine 管理台应用模板。提供契约生成的管理 API、Cookie 会话、安装引导、嵌入 SPA 与 CLI 生命周期（`init` / `serve` / `stop` / `restart` / `reload`），方便新产品从同一套分层与运维约定起步。

用 GitHub **Use this template** 创建新仓库后，按 [AGENTS.md](./AGENTS.md) 替换模块路径与品牌名即可开写业务。

## 骨架能力

| 能力 | 说明 |
|---|---|
| 契约生成 | `internal/contract` + `contractgen` → `direct` / `/api` 路由 / 前端 `api/generated` |
| 会话管理台 | Cookie 登录注册、安装状态、注册开关、`/api/me`、首用户为 admin |
| sysdoc | `settings` / `state` 按名读写 |
| 配置 | yaml 基础设施；`init` 可读 `.env` |
| 前端 | Refine + refine-ui / shadcn、i18n、profile 表单范例 |
| 运维 | Postgres 迁移、PID、Docker Compose、CI、集成测试基建（`TEST_POSTGRES_*`） |

## 本地开发

```bash
# 准备 Postgres（库名、用户见 .env.example / docker-compose）
cp .env.example .env   # 按需改端口
go run . init          # 写出 config.yaml
make dev               # 后端 serve + 前端 Vite
```

常用命令：`make generate`、`make build`、`make build amd64`。

联调管理员（首次注册即为 admin）：用户名 `Admin`，邮箱 `admin@example.com`，密码 `12345678`。

## 新产品接入

1. 替换模块路径、二进制名、站点名与 CI 镜像名。
2. 在 `contract.Backend` 增加业务路由；actions 实现；前端 pages / resources。
3. 需要对外 API 时扩 `/v1/*`（不走契约生成）。
4. 异步队列 / 实时通道按需接入，勿作为启动硬依赖。

分层约定见 [AGENTS.md](./AGENTS.md)。业务写在 `internal/actions/<域>`；Cookie 会话与 `/v1/*` 手写。

## 非目标（留给各产品）

- 具体业务域模型与页面
- 队列驱动、实时推送实现细节
