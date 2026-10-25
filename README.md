# go-refine-template

Go 单二进制 + Refine 管理台应用模板。提供契约生成的管理 API、Cookie 会话、安装引导、嵌入 SPA 与 CLI 生命周期（`init` / `serve` / `stop` / `restart` / `reload`）。

用 GitHub **Use this template** 创建新仓库后，按 [AGENTS.md](./AGENTS.md) 替换模块路径与品牌名即可开写业务。

## 骨架能力

| 能力 | 说明 |
|---|---|
| 契约生成 | `internal/contract` + `contractgen` → `direct` / `/api` 路由 / 前端 `api/generated` |
| 会话管理台 | Cookie 登录注册、`/api/me`、首用户为 admin |
| sysdoc | `settings` / `state` 按名读写 |
| 配置 | yaml 基础设施；`init` 可读 `.env` |
| 前端 | Refine + refine-ui / shadcn、i18n、profile 表单范例 |
| 运维 | Postgres 迁移、PID、Docker Compose、CI |

## 本地开发

```bash
# 准备 Postgres（库名、用户见 .env.example / docker-compose）
cp .env.example .env   # 按需改端口
go run . init          # 写出 config.yaml
make dev               # 后端 serve + 前端 Vite
```

常用命令：`make generate`、`make build`、`make build amd64`。

联调管理员（首次注册即为 admin）：用户名 `Admin`，邮箱 `admin@example.com`，密码 `12345678`。

## 分层（摘要）

见 [AGENTS.md](./AGENTS.md)。业务写在 `internal/actions/<域>`，管理 API 只扩 `contract.Backend`；Cookie 会话与 `/v1/*` 手写。
