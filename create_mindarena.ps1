# MindArena 전체 시뮬레이션 파일 자동 생성 스크립트
# 실행 위치: C:\Users\user\Documents\GitHub\MindArena
# 실행 방법: PowerShell에서 .\create_mindarena.ps1

$base = "content\simulation"

Write-Host "MindArena 파일 생성 시작..." -ForegroundColor Green

# ============================================================
# 폴더 구조 생성
# ============================================================
$folders = @(
    "$base\open\01_business",
    "$base\open\02_policy",
    "$base\pro\01_corporate",
    "$base\pro\02_governance",
    "$base\pro\03_international",
    "$base\pro\04_crisis",
    "$base\pro\05_future"
)
foreach ($f in $folders) {
    New-Item -ItemType Directory -Force -Path $f | Out-Null
}
Write-Host "✅ 폴더 구조 생성 완료" -ForegroundColor Cyan

# ============================================================
# simulation\open\01_business\README.md
# ============================================================
$content = @'
# Open 시뮬레이션 - 기업 경영 (Business Management)

> 기업은 수많은 이해관계자가 충돌하는 무대입니다.
> 주주·직원·고객·사회가 원하는 것은 각자 다릅니다.
> 기업 경영 시뮬레이션은
> 그 충돌 속에서 최선의 결정을 찾는 훈련입니다.

## 시나리오 목록

| # | 제목 | 참여자 | 시간 |
|---|------|--------|------|
| 01 | 스타트업의 첫 번째 위기 | 3-6명 | 60-90분 |
| 02 | 구조조정의 딜레마 | 4-8명 | 90-120분 |
| 03 | 글로벌 시장 진출 | 4-6명 | 90-120분 |
| 04 | ESG 경영의 선택 | 4-8명 | 90-120분 |
| 05 | 인수합병 협상 | 4-8명 | 120분+ |
'@
Set-Content -Path "$base\open\01_business\README.md" -Value $content -Encoding UTF8
Write-Host "✅ open/01_business/README.md" -ForegroundColor Cyan

# ============================================================
# simulation\open\02_policy\README.md
# ============================================================
$content = @'
# Open 시뮬레이션 - 국가 정책 (National Policy)

> 정책은 모든 사람에게 영향을 미칩니다.
> 하지만 모든 사람을 만족시킬 수는 없습니다.
> 국가 정책 시뮬레이션은
> 복잡한 이해관계 속에서
> 공공의 선을 찾는 훈련입니다.

## 시나리오 목록

| # | 제목 | 참여자 | 시간 |
|---|------|--------|------|
| 01 | 인구 감소 대응 정책 | 4-8명 | 90-120분 |
| 02 | 에너지 전환 정책 | 4-8명 | 90-120분 |
| 03 | 플랫폼 규제 딜레마 | 4-6명 | 90-120분 |
| 04 | 부동산 정책의 선택 | 4-8명 | 120분+ |
| 05 | 인공지능 규제 설계 | 4-8명 | 120분+ |
'@
Set-Content -Path "$base\open\02_policy\README.md" -Value $content -Encoding UTF8
Write-Host "✅ open/02_policy/README.md" -ForegroundColor Cyan

# ============================================================
# simulation\pro\README.md
# ============================================================
$content = @'
# Pro 시뮬레이션 (Professional Simulation)

> Open 시뮬레이션이 입문이라면
> Pro 시뮬레이션은 몰입입니다.
> 최소 3일, 최대 수주에 걸쳐 진행되는
> 전문가 수준의 장기 시뮬레이션입니다.

## Open vs Pro 비교

| 항목 | Open | Pro |
|------|------|-----|
| 소요 시간 | 1-2시간 | 최소 3일 |
| 참여자 | 4-8명 | 8-30명 |
| 정보 구조 | 모두 공개 | 역할별 비공개 |
| 대상 | 일반인·학생 | 전문가·조직·B2B |

## 카테고리

| 폴더 | 주제 | 시나리오 수 |
|------|------|------------|
| 01_corporate | 기업·경제 | 3개 |
| 02_governance | 국가 거버넌스 | 3개 |
| 03_international | 국제 관계 | 3개 |
| 04_crisis | 위기 관리 | 3개 |
| 05_future | 미래 시나리오 | 3개 |
'@
Set-Content -Path "$base\pro\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/README.md" -ForegroundColor Cyan

# ============================================================
# pro 카테고리 README 파일들
# ============================================================

# 01_corporate README
$content = @'
# Pro 시뮬레이션 - 기업·경제 (Corporate & Economy)

기업 경영 심화 시뮬레이션입니다.
국가 경제 위기, 글로벌 M&A, 산업 패권 경쟁을 다룹니다.

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 01 | 국가 경제 위기 대응 | 10-20명 | 3일 |
| 02 | 글로벌 M&A 전쟁 | 12-24명 | 3일 |
| 03 | 산업 패권 경쟁 | 15-30명 | 3-4일 |
'@
Set-Content -Path "$base\pro\01_corporate\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/01_corporate/README.md" -ForegroundColor Cyan

# 02_governance README
$content = @'
# Pro 시뮬레이션 - 국가 거버넌스 (National Governance)

국가 경영의 복잡한 의사결정을 다룹니다.
재정 위기, 헌법 개정, 선거 제도 개혁을 체험합니다.

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 04 | 국가 재정 위기 대응 | 12-20명 | 3일 |
| 05 | 헌법 개정 협상 | 15-25명 | 3-4일 |
| 06 | 선거 제도 개혁 | 10-20명 | 3일 |
'@
Set-Content -Path "$base\pro\02_governance\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/02_governance/README.md" -ForegroundColor Cyan

# 03_international README
$content = @'
# Pro 시뮬레이션 - 국제 관계 (International Relations)

무정부적 국제 질서에서 국가의 생존과 협력을 다룹니다.
한반도 평화, 경제 블록, 기후 협약을 협상합니다.

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 07 | 한반도 평화 협상 | 15-25명 | 3-4일 |
| 08 | 동아시아 경제 블록 형성 | 12-20명 | 3일 |
| 09 | 기후 협약 재협상 | 15-25명 | 3일 |
'@
Set-Content -Path "$base\pro\03_international\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/03_international/README.md" -ForegroundColor Cyan

# 04_crisis README
$content = @'
# Pro 시뮬레이션 - 위기 관리 (Crisis Management)

극도의 불확실성 속에서 신속한 결정을 훈련합니다.
팬데믹, 금융 위기, 사이버 전쟁을 대응합니다.

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 10 | 팬데믹 대응 | 15-25명 | 3일 |
| 11 | 금융 위기 대응 | 12-20명 | 3일 |
| 12 | 사이버 전쟁 대응 | 10-20명 | 2-3일 |
'@
Set-Content -Path "$base\pro\04_crisis\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/04_crisis/README.md" -ForegroundColor Cyan

# 05_future README
$content = @'
# Pro 시뮬레이션 - 미래 시나리오 (Future Scenarios)

아직 오지 않은 세계를 상상하고 준비합니다.
AI 전환, 탄소중립, 인구 절벽 사회를 설계합니다.

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 13 | AI 전환 사회 설계 | 15-25명 | 3일 |
| 14 | 탄소중립 2050 이행 | 12-20명 | 3일 |
| 15 | 인구 절벽 사회 적응 | 12-20명 | 3일 |
'@
Set-Content -Path "$base\pro\05_future\README.md" -Value $content -Encoding UTF8
Write-Host "✅ pro/05_future/README.md" -ForegroundColor Cyan

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "1단계 완료: 폴더 + README 파일 생성" -ForegroundColor Green
Write-Host "다음 스크립트: create_mindarena_2.ps1 실행" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Green
