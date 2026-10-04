#!/usr/bin/env sh
set -eu

force=false
if [ "${1:-}" = "--force" ]; then force=true; fi
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
plugin_root=$(CDPATH= cd -- "$script_dir/../../.." && pwd)
source_dir="$plugin_root/assets/pet"
codex_root="${CODEX_HOME:-$HOME/.codex}"
target_dir="$codex_root/pets/leftover-loafish"

[ -f "$source_dir/pet.json" ] && [ -f "$source_dir/spritesheet.webp" ] || {
  echo '插件内缺少宠物资源。' >&2
  exit 1
}

if [ -d "$target_dir" ] && [ "$force" != true ]; then
  if [ -f "$target_dir/pet.json" ] && [ -f "$target_dir/spritesheet.webp" ] &&
     cmp -s "$source_dir/pet.json" "$target_dir/pet.json" &&
     cmp -s "$source_dir/spritesheet.webp" "$target_dir/spritesheet.webp"; then
    printf '%s\n' 'installed=true' 'status=already-current' 'spriteVersionNumber=2' 'width=1536' 'height=2288'
    exit 0
  fi
  echo '目标目录已有不同版本。确认替换后使用 --force。' >&2
  exit 2
fi

mkdir -p "$target_dir"
cp "$source_dir/pet.json" "$target_dir/pet.json"
cp "$source_dir/spritesheet.webp" "$target_dir/spritesheet.webp"
printf '%s\n' 'installed=true' "path=$target_dir" 'spriteVersionNumber=2' 'width=1536' 'height=2288'
