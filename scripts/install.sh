#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
SOURCES_DIR="${CODEX_SKILL_SOURCES:-$HOME/.cache/codex-authority-flow/sources}"
GLOBAL_AGENTS="${CODEX_GLOBAL_AGENTS:-$HOME/.codex/AGENTS.md}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

command -v git >/dev/null || { echo "Erro: git não encontrado." >&2; exit 1; }
mkdir -p "$SKILLS_DIR" "$SOURCES_DIR" "$(dirname "$GLOBAL_AGENTS")"

install_local_authority() {
  rm -rf "$SKILLS_DIR/codex-authority-flow"
  cp -R "$ROOT_DIR/skill" "$SKILLS_DIR/codex-authority-flow"
}

clone_or_update() {
  local url="$1" name="$2"
  local dest="$SOURCES_DIR/$name"
  if [[ -d "$dest/.git" ]]; then
    git -C "$dest" pull --ff-only || echo "Aviso: não foi possível atualizar $name"
  else
    git clone --depth 1 "$url" "$dest"
  fi
}

copy_discovered_skills() {
  local source="$1"
  while IFS= read -r skill_file; do
    local dir name
    dir="$(dirname "$skill_file")"
    name="$(basename "$dir")"
    [[ "$name" == "skill" ]] && name="$(basename "$(dirname "$dir")")"
    rm -rf "$SKILLS_DIR/$name"
    cp -R "$dir" "$SKILLS_DIR/$name"
    echo "Instalada: $name"
  done < <(find "$source" -type f -name SKILL.md -not -path '*/.git/*')
}

install_local_authority

REPOS=(
  "https://github.com/obra/superpowers|superpowers"
  "https://github.com/intent-driven-dev/openspec-schemas|openspec-schemas"
  "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill|ui-ux-pro-max-skill"
  "https://github.com/Graphify-Labs/graphify|graphify"
  "https://github.com/kulaxyz/self-learning-skills|self-learning-skills"
  "https://github.com/voltagent/awesome-design-md|awesome-design-md"
  "https://github.com/Sahir619/fable-method|fable-method"
  "https://github.com/JuliusBrussee/caveman|caveman"
  "https://github.com/affaan-m/ECC|ECC"
)

for item in "${REPOS[@]}"; do
  IFS='|' read -r url name <<< "$item"
  echo "Baixando/atualizando $name..."
  clone_or_update "$url" "$name"
  copy_discovered_skills "$SOURCES_DIR/$name"
done

if [[ ! -f "$GLOBAL_AGENTS" ]]; then
  cp "$ROOT_DIR/templates/AGENTS.global.md" "$GLOBAL_AGENTS"
  echo "Criado: $GLOBAL_AGENTS"
else
  echo "Preservado: $GLOBAL_AGENTS"
  echo "Modelo disponível em: $ROOT_DIR/templates/AGENTS.global.md"
fi

echo
echo "Instalação concluída em $SKILLS_DIR"
echo "Reinicie o Codex e verifique as skills disponíveis."
