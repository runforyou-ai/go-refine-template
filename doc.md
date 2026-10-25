# 规划

## 模板目标

可复用的 Go + Refine 管理台骨架，方便新产品从同一套分层、契约生成、会话与运维约定起步。

## 已有骨架

- CLI：`init` / `serve` / `stop` / `restart` / `reload`
- Cookie 会话、安装状态、注册开关（sysdoc site）
- contractgen：Backend → direct / HTTP / 前端 TS
- 嵌入 SPA、Makefile、Docker Compose、CI
- 集成测试基建（`TEST_POSTGRES_*`）

## 新产品接入时建议

1. 替换模块路径、二进制名、站点名与 CI 镜像名。
2. 在 `contract.Backend` 增加业务路由；actions 实现；前端 pages / resources。
3. 需要对外 API 时扩 `/v1/*`（不走契约生成）。
4. 异步队列 / 实时通道按需接入，勿作为启动硬依赖。

## 非目标（留给各产品）

- 具体业务域模型与页面
- 队列驱动、实时推送实现细节
