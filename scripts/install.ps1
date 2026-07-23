$ErrorActionPreference = "Stop"

$SkillsDir = if ($env:CODEX_SKILLS_DIR) { $env:CODEX_SKILLS_DIR } else { Join-Path $HOME ".agents\skills" }
$SourcesDir = if ($env:CODEX_SKILL_SOURCES) { $env:CODEX_SKILL_SOURCES } else { Join-Path $HOME ".cache\codex-authority-flow\sources" }
$GlobalAgents = if ($env:CODEX_GLOBAL_AGENTS) { $env:CODEX_GLOBAL_AGENTS } else { Join-Path $HOME ".codex\AGENTS.md" }
$RootDir = Split-Path -Parent $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "Git não encontrado." }
New-Item -ItemType Directory -Force $SkillsDir, $SourcesDir, (Split-Path -Parent $GlobalAgents) | Out-Null

$AuthorityDest = Join-Path $SkillsDir "codex-authority-flow"
Remove-Item -Recurse -Force $AuthorityDest -ErrorAction SilentlyContinue
Copy-Item -Recurse (Join-Path $RootDir "skill") $AuthorityDest

$Repos = @(
  @{ Url="https://github.com/obra/superpowers"; Name="superpowers" },
  @{ Url="https://github.com/intent-driven-dev/openspec-schemas"; Name="openspec-schemas" },
  @{ Url="https://github.com/nextlevelbuilder/ui-ux-pro-max-skill"; Name="ui-ux-pro-max-skill" },
  @{ Url="https://github.com/Graphify-Labs/graphify"; Name="graphify" },
  @{ Url="https://github.com/kulaxyz/self-learning-skills"; Name="self-learning-skills" },
  @{ Url="https://github.com/voltagent/awesome-design-md"; Name="awesome-design-md" },
  @{ Url="https://github.com/Sahir619/fable-method"; Name="fable-method" },
  @{ Url="https://github.com/JuliusBrussee/caveman"; Name="caveman" },
  @{ Url="https://github.com/affaan-m/ECC"; Name="ECC" }
)

foreach ($Repo in $Repos) {
  $Dest = Join-Path $SourcesDir $Repo.Name
  Write-Host "Baixando/atualizando $($Repo.Name)..."
  if (Test-Path (Join-Path $Dest ".git")) {
    & git -C $Dest pull --ff-only
  } else {
    & git clone --depth 1 $Repo.Url $Dest
  }

  Get-ChildItem -Path $Dest -Filter SKILL.md -File -Recurse | Where-Object { $_.FullName -notmatch "[\\/]\.git[\\/]" } | ForEach-Object {
    $SkillDir = $_.Directory.FullName
    $Name = $_.Directory.Name
    if ($Name -eq "skill") { $Name = $_.Directory.Parent.Name }
    $Target = Join-Path $SkillsDir $Name
    Remove-Item -Recurse -Force $Target -ErrorAction SilentlyContinue
    Copy-Item -Recurse $SkillDir $Target
    Write-Host "Instalada: $Name"
  }
}

if (-not (Test-Path $GlobalAgents)) {
  Copy-Item (Join-Path $RootDir "templates\AGENTS.global.md") $GlobalAgents
  Write-Host "Criado: $GlobalAgents"
} else {
  Write-Host "Preservado: $GlobalAgents"
  Write-Host "Modelo disponível em templates\AGENTS.global.md"
}

Write-Host ""
Write-Host "Instalação concluída em $SkillsDir"
Write-Host "Reinicie o Codex e verifique as skills disponíveis."
