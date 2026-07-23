from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path

from . import __version__

REPOSITORIES = (
    ("https://github.com/obra/superpowers", "superpowers"),
    ("https://github.com/intent-driven-dev/openspec-schemas", "openspec-schemas"),
    ("https://github.com/nextlevelbuilder/ui-ux-pro-max-skill", "ui-ux-pro-max-skill"),
    ("https://github.com/Graphify-Labs/graphify", "graphify"),
    ("https://github.com/kulaxyz/self-learning-skills", "self-learning-skills"),
    ("https://github.com/voltagent/awesome-design-md", "awesome-design-md"),
    ("https://github.com/Sahir619/fable-method", "fable-method"),
    ("https://github.com/JuliusBrussee/caveman", "caveman"),
    ("https://github.com/affaan-m/ECC", "ECC"),
)


def _paths() -> tuple[Path, Path, Path, Path]:
    home = Path.home()
    skills = Path(os.environ.get("CODEX_SKILLS_DIR", home / ".agents" / "skills"))
    sources = Path(os.environ.get("CODEX_SKILL_SOURCES", home / ".cache" / "codex-authority-flow" / "sources"))
    agents = Path(os.environ.get("CODEX_GLOBAL_AGENTS", home / ".codex" / "AGENTS.md"))
    assets = Path(__file__).parent / "assets"
    return skills, sources, agents, assets


def _run(*args: str, cwd: Path | None = None) -> None:
    subprocess.run(args, cwd=cwd, check=True)


def install() -> None:
    if shutil.which("git") is None:
        raise SystemExit("Erro: Git não foi encontrado. Instale o Git e execute novamente.")

    skills, sources, agents, assets = _paths()
    skills.mkdir(parents=True, exist_ok=True)
    sources.mkdir(parents=True, exist_ok=True)
    agents.parent.mkdir(parents=True, exist_ok=True)

    authority_dest = skills / "codex-authority-flow"
    shutil.rmtree(authority_dest, ignore_errors=True)
    shutil.copytree(assets / "skill", authority_dest)

    for url, name in REPOSITORIES:
        destination = sources / name
        print(f"Baixando/atualizando {name}...")
        if (destination / ".git").is_dir():
            try:
                _run("git", "-C", str(destination), "pull", "--ff-only")
            except subprocess.CalledProcessError:
                print(f"Aviso: não foi possível atualizar {name}.", file=sys.stderr)
        else:
            _run("git", "clone", "--depth", "1", url, str(destination))

        for skill_file in destination.rglob("SKILL.md"):
            if ".git" in skill_file.parts:
                continue
            source_dir = skill_file.parent
            skill_name = source_dir.parent.name if source_dir.name == "skill" else source_dir.name
            target = skills / skill_name
            shutil.rmtree(target, ignore_errors=True)
            shutil.copytree(source_dir, target)
            print(f"Instalada: {skill_name}")

    if not agents.exists():
        shutil.copy2(assets / "templates" / "AGENTS.global.md", agents)
        print(f"Criado: {agents}")
    else:
        print(f"Preservado: {agents}")

    print(f"\nInstalação concluída em {skills}")
    print("Reinicie o Codex e verifique as skills disponíveis.")


def doctor() -> int:
    skills, _, agents, assets = _paths()
    checks = (
        ("Python >= 3.9", sys.version_info >= (3, 9)),
        ("Git disponível", shutil.which("git") is not None),
        ("Pacote contém SKILL.md", (assets / "skill" / "SKILL.md").is_file()),
        ("Skill instalada", (skills / "codex-authority-flow" / "SKILL.md").is_file()),
        ("AGENTS.md global", agents.is_file()),
    )
    print(f"Codex Authority Flow v{__version__}")
    for label, ok in checks:
        print(f"{'✓' if ok else '✗'} {label}")
    print(f"Skills: {skills}")
    print(f"AGENTS: {agents}")
    return 0 if checks[1][1] and checks[2][1] else 1


def main() -> None:
    parser = argparse.ArgumentParser(prog="codex-authority-flow")
    parser.add_argument("command", nargs="?", default="install", choices=("install", "update", "doctor", "version"))
    args = parser.parse_args()

    if args.command in {"install", "update"}:
        install()
    elif args.command == "doctor":
        raise SystemExit(doctor())
    else:
        print(__version__)
