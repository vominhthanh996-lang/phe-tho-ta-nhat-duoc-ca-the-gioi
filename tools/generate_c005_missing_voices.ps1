$ErrorActionPreference = "Stop"
$env:AUTO_VIDEO_EXTRA_PACKAGES = "E:\ThanhMV\python-packages"
$python = "C:\Users\thanh\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
$presets = @(
  "nam-tram",
  "nu-cham-am",
  "nam-cang-thang",
  "nu-nhe-nhang"
)

foreach ($preset in $presets) {
  Write-Output "=== Generating $preset ==="
  & $python tools\generate_chapter_audio.py --chapter c005 --preset $preset --engine video --overwrite
  if ($LASTEXITCODE -ne 0) {
    throw "Failed generating $preset"
  }
}

& $python tools\build_doc_truyen_data.py
if ($LASTEXITCODE -ne 0) {
  throw "Failed rebuilding data.js"
}

Write-Output "=== Done generating missing c005 voices ==="
