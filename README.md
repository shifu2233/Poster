# Canvas Commerce — Codex Agent Execution Pack

这是一个面向美国市场的帆布画 / 海报独立商城实施包，目标是支持约 100–500 名同时在线用户，并可平滑扩展。

核心业务约束：
- 普通商品：Canvas Wall Art / Posters，支持多尺寸、Framed / Unframed。
- 个性化定制：**网站不上传客户图片**。客户选择规格后生成 Customization ID，通过客服 WS 发送图片并沟通确认。
- 网站负责：商品浏览、搜索、筛选、购物车、支付、订单、定制请求编号、客服工作流、后台管理。
- V1 不做：在线图片上传、在线裁切、AI 图像处理、复杂微服务、Kubernetes、多卖家 Marketplace。

## 推荐技术栈
- Storefront: Next.js + React + TypeScript
- Admin: Next.js + React + TypeScript
- API: NestJS + TypeScript
- Database: PostgreSQL
- Cache: Redis
- Object Storage: Amazon S3（商品图）
- CDN: CloudFront
- Infra: AWS ALB + EC2 Auto Scaling + RDS PostgreSQL + ElastiCache/Redis + S3 + CloudFront + WAF
- Deployment: Docker + GitHub Actions
- Payment: Stripe + PayPal

## 如何给 Codex Agent 使用
1. 解压本包到一个空 Git 仓库根目录。
2. 让 Codex 首先阅读 `AGENTS.md`，然后阅读 `CODEX_MASTER_PROMPT.md`。
3. Codex 必须按 `docs/08_IMPLEMENTATION_PLAN.md` 阶段执行，不允许直接跳到生产部署。
4. 每阶段完成后运行 `docs/09_ACCEPTANCE_TESTS.md` 中对应验收。
5. 所有凭据通过环境变量或云端 Secret Manager 注入，禁止提交到 Git。

## 目录
- `AGENTS.md`：Codex 的最高优先级项目执行规则
- `CODEX_MASTER_PROMPT.md`：可以直接复制给 Codex Agent 的总任务说明
- `docs/`：产品、架构、数据库、API、UI、AWS、安全、实施与验收
- `infra/`：基础设施执行约束与 Terraform 目标结构
- `scripts/`：Agent 可使用/扩展的脚本入口
