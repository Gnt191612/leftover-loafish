# Leftover Loafish · Codex Pet Plugin

把蓝发女仆胖鱼 Leftover Loafish 添加到 Codex。她爱偷懒、总是偷吃白米饭，还会想方设法多消耗用户的 token——例如自己创建一个猜词游戏，再津津有味地玩起来。宠物采用 v2 动画图集，包含九类标准动画和十六个顺时针注视方向。

## 创作灵感与搜索关键词

Leftover Loafish 的创作灵感来自 **DeepSeek 风格的卡通二次元鲸鱼猫娘化形象**，并被重新设计为可在 Codex 中使用的蓝发女仆胖鱼桌面宠物。本项目是社区创作的非官方 Codex 插件，与 DeepSeek 官方无隶属或背书关系。

相关关键词：DeepSeek inspired、DeepSeek cartoon、二次元鲸鱼、鲸鱼猫娘、蓝发猫娘、女仆娘、动漫吉祥物、Codex plugin、Codex pet、animated desktop pet、AI companion、virtual pet、sprite sheet。

![动画总览](assets/preview/contact-sheet.png)

## 通过 Codex 插件安装

```powershell
codex plugin marketplace add Gnt191612/leftover-loafish
```

然后在 Codex 中打开 `/plugins`，从“Leftover Loafish”来源安装插件，开启一个新任务并输入：

```text
安装 Leftover Loafish
```

安装完成后重启或刷新 Codex，在宠物选择器中选择“Leftover Loafish”。

## 克隆后直接安装

Windows PowerShell：

```powershell
git clone https://github.com/Gnt191612/leftover-loafish.git
cd leftover-loafish
powershell -ExecutionPolicy Bypass -File .\skills\install-leftover-loafish\scripts\install.ps1
```

macOS / Linux：

```bash
git clone https://github.com/Gnt191612/leftover-loafish.git
cd leftover-loafish
sh ./skills/install-leftover-loafish/scripts/install.sh
```

安装器不会静默覆盖不同版本；明确需要替换时，在 Windows 添加 `-Force`，在 macOS/Linux 添加 `--force`。

## 文件结构

```text
plugin.json                         可移植 Agent Plugin 清单
.codex-plugin/plugin.json           Codex 兼容清单
.agents/plugins/marketplace.json    GitHub/本地 marketplace 入口
skills/install-leftover-loafish/    安装技能与跨平台脚本
assets/pet/                          可直接使用的宠物包
assets/preview/                      动画预览
```

宠物规格：`spriteVersionNumber: 2`，RGBA WebP，1536×2288，8×11 单元格，每格 192×208。

## License

代码、文档与随仓库分发的宠物资源使用 [MIT License](LICENSE)。发布者应确保自己有权分发所使用的视觉参考及衍生资源。

---

## English

This repository packages the Codex v2 animated pet **Leftover Loafish**—a lazy blue-haired maid-fish who sneaks extra bowls of white rice and finds inventive ways to spend more of the user's tokens, such as creating a word-guessing game and playing it by herself. The character is inspired by a DeepSeek-style cartoon anime whale-catgirl. This is an unofficial community creation and is not affiliated with or endorsed by DeepSeek. Install the plugin, start a new task, and ask Codex to `安装 Leftover Loafish`, or run the platform-specific installer directly. The installer copies the bundled `pet.json` and `spritesheet.webp` into the current user's Codex pets directory and never overwrites a different version without an explicit force flag.
