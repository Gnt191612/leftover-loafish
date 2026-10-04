---
name: install-leftover-loafish
description: Install or refresh the bundled Codex v2 pet “Leftover Loafish” when the user asks to add, install, enable, or update this pet. Do not use for unrelated pets.
---

# 安装 Leftover Loafish

将插件自带的 `assets/pet/pet.json` 和 `assets/pet/spritesheet.webp` 安装到用户的 Codex 宠物目录。

## 工作流

1. 确认用户明确要求安装、添加或更新该宠物。
2. 在 Windows 上运行 `${PLUGIN_ROOT}/skills/install-leftover-loafish/scripts/install.ps1`；在 macOS 或 Linux 上运行 `${PLUGIN_ROOT}/skills/install-leftover-loafish/scripts/install.sh`。
3. 如果目标目录已有不同文件，脚本会停止。说明现有宠物不会被自动覆盖；只有用户明确要求替换时才使用 `-Force` 或 `--force` 重试。
4. 检查脚本输出中的 `installed=true`、`spriteVersionNumber=2`、`width=1536`、`height=2288`。
5. 告知用户重启或刷新 Codex 后选择“Leftover Loafish”。

不要修改插件自带资源，不要删除其他宠物，不要读取或输出凭据。
