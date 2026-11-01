# homebrew-schedule
homebrew core/cask update schedule.

第三方 tap 需要先信任一次，否则 `brew install` 会报 `Refusing to load cask from untrusted tap`：

```bash
brew trust nxyd/tap
```

## Cask List

#### ClashX.Meta

install: `brew install --cask nxyd/homebrew-tap/clashx-meta`

#### FlClash

install: `brew install --cask nxyd/homebrew-tap/flclash`

#### PiliPlus

install: `brew install --cask nxyd/homebrew-tap/piliplus`

PiliPlus 未使用 Apple Developer ID 签名、未公证（官方 homebrew-cask 因此拒收，见 [PR #245301](https://github.com/Homebrew/homebrew-cask/pull/245301)）。
Homebrew 下载的包不带 quarantine 属性，一般可直接打开；若被系统拦下，到「系统设置 → 隐私与安全性」里放行。

#### PI-Desktop

install: `brew install --cask nxyd/homebrew-tap/pi-desktop`

PI-Desktop 自带 electron-updater 自动更新，cask 标记了 `auto_updates true`；如需由 Homebrew 统一升级，跳过其内置更新即可。
支持 Apple Silicon 与 Intel 两种架构，macOS 12 (Monterey) 及以上。
