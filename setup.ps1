# MindArena Setup Script
# Run from: C:\Users\user\Documents\GitHub\MindArena
# Command: powershell -ExecutionPolicy Bypass -File .\setup.ps1

$base = "content\simulation"

# Create folders
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
Write-Host "Folders created OK"

# Function to write UTF8 file
function Write-UTF8File {
    param($path, $text)
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText(
        (Join-Path (Get-Location) $path),
        $text,
        $utf8NoBom
    )
}

# --- open/01_business/README.md ---
Write-UTF8File "$base\open\01_business\README.md" @"
# Open 시뮬레이션 - 기업 경영

| # | 제목 | 참여자 | 시간 |
|---|------|--------|------|
| 01 | 스타트업의 첫 번째 위기 | 3-6명 | 60-90분 |
| 02 | 구조조정의 딜레마 | 4-8명 | 90-120분 |
| 03 | 글로벌 시장 진출 | 4-6명 | 90-120분 |
| 04 | ESG 경영의 선택 | 4-8명 | 90-120분 |
| 05 | 인수합병 협상 | 4-8명 | 120분+ |
"@
Write-Host "OK: open/01_business/README.md"

# --- open/02_policy/README.md ---
Write-UTF8File "$base\open\02_policy\README.md" @"
# Open 시뮬레이션 - 국가 정책

| # | 제목 | 참여자 | 시간 |
|---|------|--------|------|
| 01 | 인구 감소 대응 정책 | 4-8명 | 90-120분 |
| 02 | 에너지 전환 정책 | 4-8명 | 90-120분 |
| 03 | 플랫폼 규제 딜레마 | 4-6명 | 90-120분 |
| 04 | 부동산 정책의 선택 | 4-8명 | 120분+ |
| 05 | 인공지능 규제 설계 | 4-8명 | 120분+ |
"@
Write-Host "OK: open/02_policy/README.md"

# --- pro/README.md ---
Write-UTF8File "$base\pro\README.md" @"
# Pro 시뮬레이션

| 카테고리 | 주제 | 시나리오 수 |
|---------|------|------------|
| 01_corporate | 기업·경제 | 3개 |
| 02_governance | 국가 거버넌스 | 3개 |
| 03_international | 국제 관계 | 3개 |
| 04_crisis | 위기 관리 | 3개 |
| 05_future | 미래 시나리오 | 3개 |
"@
Write-Host "OK: pro/README.md"

# --- pro category READMEs ---
Write-UTF8File "$base\pro\01_corporate\README.md" @"
# Pro - 기업·경제

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 01 | 국가 경제 위기 대응 | 10-20명 | 3일 |
| 02 | 글로벌 M&A 전쟁 | 12-24명 | 3일 |
| 03 | 산업 패권 경쟁 | 15-30명 | 3-4일 |
"@
Write-Host "OK: pro/01_corporate/README.md"

Write-UTF8File "$base\pro\02_governance\README.md" @"
# Pro - 국가 거버넌스

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 04 | 국가 재정 위기 대응 | 12-20명 | 3일 |
| 05 | 헌법 개정 협상 | 15-25명 | 3-4일 |
| 06 | 선거 제도 개혁 | 10-20명 | 3일 |
"@
Write-Host "OK: pro/02_governance/README.md"

Write-UTF8File "$base\pro\03_international\README.md" @"
# Pro - 국제 관계

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 07 | 한반도 평화 협상 | 15-25명 | 3-4일 |
| 08 | 동아시아 경제 블록 형성 | 12-20명 | 3일 |
| 09 | 기후 협약 재협상 | 15-25명 | 3일 |
"@
Write-Host "OK: pro/03_international/README.md"

Write-UTF8File "$base\pro\04_crisis\README.md" @"
# Pro - 위기 관리

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 10 | 팬데믹 대응 | 15-25명 | 3일 |
| 11 | 금융 위기 대응 | 12-20명 | 3일 |
| 12 | 사이버 전쟁 대응 | 10-20명 | 2-3일 |
"@
Write-Host "OK: pro/04_crisis/README.md"

Write-UTF8File "$base\pro\05_future\README.md" @"
# Pro - 미래 시나리오

| # | 제목 | 참여자 | 기간 |
|---|------|--------|------|
| 13 | AI 전환 사회 설계 | 15-25명 | 3일 |
| 14 | 탄소중립 2050 이행 | 12-20명 | 3일 |
| 15 | 인구 절벽 사회 적응 | 12-20명 | 3일 |
"@
Write-Host "OK: pro/05_future/README.md"

# --- open/01_business scenarios ---
Write-UTF8File "$base\open\01_business\scenario_01.md" @"
# 시나리오 01: 스타트업의 첫 번째 위기

창업 2년 차, 투자금이 3개월치밖에 남지 않았습니다.

## 기본 정보
- 참여자: 3-6명 / 시간: 60-90분 / 난이도: ⭐⭐

## 상황
스타트업 코리아나랩: 현금 1.2억, 월 번-레이트 4천만, 유료 고객 12개사

## 옵션 A: 긴축
개발자 1명 정리해고, 마케팅 삭감, 6개월 런웨이 확보

## 옵션 B: 피벗
B2B→B2C 전환, 신규 투자 유치

## 옵션 C: 매각
경쟁사에 인수합병 협상

## 역할
대표이사 / CTO / 투자자 / 핵심 개발자 / 영업팀장
"@
Write-Host "OK: open/01_business/scenario_01.md"

Write-UTF8File "$base\open\01_business\scenario_02.md" @"
# 시나리오 02: 구조조정의 딜레마

매출 30% 감소, 이사회는 인력 20% 감축을 요구합니다.

## 기본 정보
- 참여자: 4-8명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 상황
코리아나제조: 500명 규모, 100명 감원 요구, 노조 결성 6개월

## 핵심 결정
1. 감원 방식: 희망퇴직 vs 성과 기반 vs 부서 통폐합
2. 소통: 전체 공개 vs 순차 통보 vs 개별 면담
3. 보상: 법정 최소 vs 추가 위로금 vs 재취업 지원

## 역할
CEO / HR팀장 / 노조위원장 / 중간관리자 / 이사회 대표
"@
Write-Host "OK: open/01_business/scenario_02.md"

Write-UTF8File "$base\open\01_business\scenario_03.md" @"
# 시나리오 03: 글로벌 시장 진출

동남아시아 시장 진출 기회가 생겼습니다. 준비가 완전하지 않습니다.

## 기본 정보
- 참여자: 4-6명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 상황
코리아나푸드: 국내 성장 정체, 베트남 파트너십 제안, 투자 50억 필요

## 옵션 A: 즉시 진출 (합작법인)
## 옵션 B: 단계적 진출 (테스트 수출)
## 옵션 C: 독자 진출 (직접 법인)

## 역할
CEO / CFO / 해외사업팀장 / 법무팀장 / 현지 파트너
"@
Write-Host "OK: open/01_business/scenario_03.md"

Write-UTF8File "$base\open\01_business\scenario_04.md" @"
# 시나리오 04: ESG 경영의 선택

환경 규제 강화. ESG 도입 비용 vs 장기 브랜드 가치.

## 기본 정보
- 참여자: 4-8명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 상황
코리아나케미컬: 탄소 업계 평균 +40%, ESG 도입 비용 3년간 200억

## 결정 1: ESG 범위 (전면/환경만/공시만)
## 결정 2: 재원 (자체현금/녹색채권/단계적)
## 결정 3: 소통 (적극 브랜딩/조용한 전환/규제 대응)

## 역할
CEO / 기관투자자 / 환경단체 / 노동조합 / 지역주민
"@
Write-Host "OK: open/01_business/scenario_04.md"

Write-UTF8File "$base\open\01_business\scenario_05.md" @"
# 시나리오 05: 인수합병 협상

경쟁사가 시가 대비 35% 높은 인수 제안을 해왔습니다.

## 기본 정보
- 참여자: 4-8명 / 시간: 120분+ / 난이도: ⭐⭐⭐⭐

## 상황
코리아나테크(피인수): 직원 200명, 창업주 지분 28%
메가코프(인수): 브랜드 통합·구조조정 가능성

## 협상 의제
1. 최종 인수가 / 2. 고용 보장 기간
3. 브랜드 독립성 / 4. 창업주 역할 / 5. 경영 자율성

## 역할
코리아나테크 창업주 / CFO / 메가코프 M&A팀 / 노조 / 소액주주
"@
Write-Host "OK: open/01_business/scenario_05.md"

# --- open/02_policy scenarios ---
Write-UTF8File "$base\open\02_policy\scenario_01.md" @"
# 시나리오 01: 인구 감소 대응 정책

출산율 0.7, 세계 최저. 지방 도시가 소멸하고 있습니다.

## 기본 정보
- 참여자: 4-8명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 옵션 A: 출산 장려 (아이 1명당 1억, 무상 보육)
## 옵션 B: 이민 확대 (연간 50만 명 수용)
## 옵션 C: 지방 집중 투자 (거점 도시 육성)

## 역할
보건복지부장관 / 지방 소도시 시장 / 이민자 단체 / 청년 대표 / 재정 전문가
"@
Write-Host "OK: open/02_policy/scenario_01.md"

Write-UTF8File "$base\open\02_policy\scenario_02.md" @"
# 시나리오 02: 에너지 전환 정책

탄소중립 2050 약속. 석탄·원전·재생에너지 믹스 선택.

## 기본 정보
- 참여자: 4-8명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 옵션 A: 재생에너지 중심 (2035년 70%, 석탄 폐지)
## 옵션 B: 원전+재생에너지 (원전 유지·확대)
## 옵션 C: 현실적 전환 (2038년 단계적 폐지)

## 역할
산업부장관 / 환경부장관 / 석탄지역 주민 / 환경단체 / 에너지 경제학자
"@
Write-Host "OK: open/02_policy/scenario_02.md"

Write-UTF8File "$base\open\02_policy\scenario_03.md" @"
# 시나리오 03: 플랫폼 규제 딜레마

배달앱 수수료 27% 인상. 음식점·소비자·라이더 모두 피해.

## 기본 정보
- 참여자: 4-6명 / 시간: 90-120분 / 난이도: ⭐⭐⭐

## 옵션 A: 수수료 상한제 (법정 상한 15%)
## 옵션 B: 공공 플랫폼 (정부 운영, 수수료 2-3%)
## 옵션 C: 자율 규제 (공개 의무화, 시장 경쟁)

## 역할
공정거래위원회 / 배달 플랫폼 / 음식점 협회 / 소비자 단체 / 배달 라이더
"@
Write-Host "OK: open/02_policy/scenario_03.md"

Write-UTF8File "$base\open\02_policy\scenario_04.md" @"
# 시나리오 04: 부동산 정책의 선택

서울 아파트 평균 11억. 집값 잡기 vs 공급 확대.

## 기본 정보
- 참여자: 4-8명 / 시간: 120분+ / 난이도: ⭐⭐⭐⭐

## 옵션 A: 공급 확대 (그린벨트 해제, 재건축 완화)
## 옵션 B: 수요 억제 (다주택자 세금 강화, 대출 규제)
## 옵션 C: 공공 임대 확충 (20% 목표)

## 역할
국토부장관 / 다주택 임대인 / 무주택 청년 / 건설업계 / 환경단체
"@
Write-Host "OK: open/02_policy/scenario_04.md"

Write-UTF8File "$base\open\02_policy\scenario_05.md" @"
# 시나리오 05: 인공지능 규제 설계

AI 혁신 vs 안전. 일자리·프라이버시·안보 위협.

## 기본 정보
- 참여자: 4-8명 / 시간: 120분+ / 난이도: ⭐⭐⭐⭐

## 옵션 A: 강력 사전 규제 (EU 모델, 고위험 AI 사전 승인)
## 옵션 B: 사후 규제 (미국 모델, 자율 규제)
## 옵션 C: 위험 비례 규제 (중간 모델)

## 역할
과기부장관 / AI 스타트업 / AI 피해자 / 노동조합 / AI 윤리 전문가
"@
Write-Host "OK: open/02_policy/scenario_05.md"

# --- pro/01_corporate scenarios ---
Write-UTF8File "$base\pro\01_corporate\scenario_01.md" @"
# Pro 시나리오 01: 국가 경제 위기 대응

외환보유액 급감, IMF 구제금융, 대기업 3곳 동시 유동성 위기.
72시간 안에 결정해야 합니다.

## 기본 정보
- 참여자: 10-20명 / 기간: 3일 / 활용: 경영대학원·공공정책

## 참여 팀
- A팀: 정부 경제팀 (위기 대응 총괄)
- B팀: 대기업 경영진 (자구 방안)
- C팀: IMF (구제금융 조건 협상)
- D팀: 시민사회 (서민 보호)
- E팀: 외국인 투자자 (투자금 회수)

## 3일 구조
- Day 1: 위기 파악 + 포지션
- Day 2: 협상 + 위기 이벤트
- Day 3: 최종 결정 + 성찰

## 실제 사례
1997년 한국 IMF 외환위기 / 2008년 글로벌 금융위기
"@
Write-Host "OK: pro/01_corporate/scenario_01.md"

Write-UTF8File "$base\pro\01_corporate\scenario_02.md" @"
# Pro 시나리오 02: 글로벌 M&A 전쟁

반도체 기업 아시아반도체에 미국·중국 동시 인수 제안.
지정학적 M&A 전쟁.

## 기본 정보
- 참여자: 12-24명 / 기간: 3일 / 활용: 경영대학원·투자은행

## 참여 팀
- A팀: 아시아반도체 경영진
- B팀: 미국 테크자이언트 (적대적 인수)
- C팀: 중국 드래곤칩 (우호적 인수)
- D팀: 코리아나 정부
- E팀: 주요 주주 연합
- F팀: 언론·시민사회

## 실제 사례
ARM 인수 시도 / TSMC와 미중 / 퀄컴 NXP 인수 실패
"@
Write-Host "OK: pro/01_corporate/scenario_02.md"

Write-UTF8File "$base\pro\01_corporate\scenario_03.md" @"
# Pro 시나리오 03: 산업 패권 경쟁

2030년 배터리 패권 전쟁. 중국 저가 공세 + 미국 IRA 역차별.
코리아나 배터리 3사의 생존 전략.

## 기본 정보
- 참여자: 15-30명 / 기간: 3-4일 / 활용: 경영대학원·산업부

## 참여 팀
- A팀: 코리아나 정부
- B팀: 배터리 3사 경영진
- C팀: 미국 에너지부
- D팀: 중국 상무부
- E팀: 글로벌 완성차 연합
- F팀: 언론·시민사회

## 실제 사례
한국 배터리 3사와 IRA / CATL 글로벌 전략
"@
Write-Host "OK: pro/01_corporate/scenario_03.md"

# --- pro/02_governance scenarios ---
Write-UTF8File "$base\pro\02_governance\scenario_01.md" @"
# Pro 시나리오 04: 국가 재정 위기 대응

국가 부채 GDP 100% 초과. 국민연금 15년 후 고갈.
세금 vs 복지 삭감의 딜레마.

## 기본 정보
- 참여자: 12-20명 / 기간: 3일 / 활용: 공공정책·행정학 대학원

## 참여 팀
- A팀: 행정부 (총리실·기재부)
- B팀: 여당
- C팀: 제1야당
- D팀: 소수정당 (캐스팅 보트)
- E팀: 이익단체 (경총·노총·노인연합)
- F팀: 언론·시민사회

## 실제 사례
스웨덴 연금 개혁 / 그리스 재정 위기 / 일본 잃어버린 30년
"@
Write-Host "OK: pro/02_governance/scenario_01.md"

Write-UTF8File "$base\pro\02_governance\scenario_02.md" @"
# Pro 시나리오 05: 헌법 개정 협상

권력 구조·기본권·지방분권·경제조항·안보 5대 쟁점.
2/3 합의가 필요한 헌법 개정.

## 기본 정보
- 참여자: 15-25명 / 기간: 3-4일 / 활용: 법학·정치학 대학원

## 참여 팀
- A팀: 여당 헌법특위
- B팀: 야당 헌법특위
- C팀: 소수정당 연합
- D팀: 시민사회 헌법포럼
- E팀: 보수단체·종교계
- F팀: 언론·헌법재판소

## 실제 사례
한국 헌법 개정 역사 / 독일 기본법 / 아이슬란드 크라우드소싱
"@
Write-Host "OK: pro/02_governance/scenario_02.md"

Write-UTF8File "$base\pro\02_governance\scenario_03.md" @"
# Pro 시나리오 06: 선거 제도 개혁

소선거구제 vs 비례대표제. 정당마다 자신에게 유리한 제도를 원합니다.

## 기본 정보
- 참여자: 10-20명 / 기간: 3일 / 활용: 정치학·행정학 대학원

## 참여 팀
- A팀: 여당 (기득권 방어)
- B팀: 야당 (개혁 요구)
- C팀: 소수정당 (비례 확대)
- D팀: 선관위 (기술 검토)
- E팀: 시민사회 (민주주의 강화)
- F팀: 언론·시민 (유권자 관점)

## 실제 사례
한국 선거 제도 변천 / 뉴질랜드 개혁 / 독일 연동형
"@
Write-Host "OK: pro/02_governance/scenario_03.md"

# --- pro/03_international scenarios ---
Write-UTF8File "$base\pro\03_international\scenario_01.md" @"
# Pro 시나리오 07: 한반도 평화 협상

70년 분단. 비핵화·평화체제·경제협력·인권.
6자 + 유엔 다자 협상.

## 기본 정보
- 참여자: 15-25명 / 기간: 3-4일 / 활용: 국제관계학·외교안보

## 참여 팀
- A팀: 한국 / B팀: 북한 / C팀: 미국
- D팀: 중국 / E팀: 일본 / F팀: 러시아 / G팀: 유엔

## 핵심 의제
비핵화 단계 / 평화협정 / 제재 완화 / 인권 / 군사 긴장 완화

## 실제 사례
제네바 합의 / 6자회담 / 싱가포르·하노이 회담
"@
Write-Host "OK: pro/03_international/scenario_01.md"

Write-UTF8File "$base\pro\03_international\scenario_02.md" @"
# Pro 시나리오 08: 동아시아 경제 블록 형성

미중 경제 전쟁. 미국 블록 vs 중국 블록 vs 동아시아 독자 연대.

## 기본 정보
- 참여자: 12-20명 / 기간: 3일 / 활용: 국제관계·경제학 대학원

## 참여 팀
- A팀: 한국 / B팀: 일본 / C팀: 대만
- D팀: 아세안 / E팀: 미국 / F팀: 중국

## 핵심 쟁점
IPEF 참여 / 반도체 공급망 / 위안화 결제 / 탄소국경세

## 실제 사례
미중 무역 전쟁 / IPEF vs RCEP / 사드 사태
"@
Write-Host "OK: pro/03_international/scenario_02.md"

Write-UTF8File "$base\pro\03_international\scenario_03.md" @"
# Pro 시나리오 09: 기후 협약 재협상

파리협정 붕괴 직전. 선진국 vs 개발도상국.
인류 역사상 가장 복잡한 협상.

## 기본 정보
- 참여자: 15-25명 / 기간: 3일 / 활용: 국제관계·환경정책 대학원

## 참여 팀
- A팀: EU·선도국 / B팀: 미국 / C팀: 중국
- D팀: 기후 취약국 / E팀: 신흥국 / F팀: 산유국 / G팀: 유엔·NGO

## 핵심 의제
온도 목표 / 감축 의무 / 기후 재원 / 손실과 피해 / 탄소 시장

## 실제 사례
교토의정서 실패 / 파리협정 성과·한계 / COP28 두바이
"@
Write-Host "OK: pro/03_international/scenario_03.md"

# --- pro/04_crisis scenarios ---
Write-UTF8File "$base\pro\04_crisis\scenario_01.md" @"
# Pro 시나리오 10: 팬데믹 대응

X 바이러스 발생. 치명률 불확실. 경제 vs 생명.
72시간 내 국가 대응 결정.

## 기본 정보
- 참여자: 15-25명 / 기간: 3일 / 활용: 보건·행정·위기관리 대학원

## 참여 팀
- A팀: 총리실 (총괄)
- B팀: 보건부·질병청
- C팀: 경제부처
- D팀: 지방정부
- E팀: 언론
- F팀: 의료계·시민사회

## 핵심 결정
국경 통제 / 공개 발표 수준 / 거리두기 / 휴교 / 경제 지원

## 실제 사례
한국 메르스 2015 / 한국 코로나19 2020 / 스웨덴 집단면역
"@
Write-Host "OK: pro/04_crisis/scenario_01.md"

Write-UTF8File "$base\pro\04_crisis\scenario_02.md" @"
# Pro 시나리오 11: 금융 위기 대응

금요일 오후 3시. 4위 은행 뱅크런. 48시간 내 해결 필요.
구제 vs 파산의 딜레마.

## 기본 정보
- 참여자: 12-20명 / 기간: 3일 / 활용: 경제학·금융·행정 대학원

## 참여 팀
- A팀: 금융위원회
- B팀: 한국은행
- C팀: 기획재정부
- D팀: 코리아나뱅크 경영진
- E팀: 언론·시민
- F팀: 국제 금융 기관

## 3대 처리 방안
1. 공적 자금 정상화 / 2. 합병 / 3. 파산 정리

## 실제 사례
리먼 브라더스 / AIG 구제금융 / SVB / 한국 저축은행 사태
"@
Write-Host "OK: pro/04_crisis/scenario_02.md"

Write-UTF8File "$base\pro\04_crisis\scenario_03.md" @"
# Pro 시나리오 12: 사이버 전쟁 대응

오전 6시 30분. 전력망·금융·교통 동시 공격.
공격자 미확인. 반격할 것인가?

## 기본 정보
- 참여자: 10-20명 / 기간: 2-3일 / 활용: 사이버안보·국방·행정 대학원

## 참여 팀
- A팀: 국가사이버안전센터 (NCSC)
- B팀: 국가안보실
- C팀: 행안부·과기부
- D팀: 군 사이버사령부
- E팀: 언론·시민
- F팀: 동맹국

## 핵심 결정
공개 수준 / 인터넷 차단 / 군 투입 / 반격 여부 / 귀속 공개

## 실제 사례
우크라이나 전력망 / 에스토니아 / 한국 주요 사이버 사건
"@
Write-Host "OK: pro/04_crisis/scenario_03.md"

# --- pro/05_future scenarios ---
Write-UTF8File "$base\pro\05_future\scenario_01.md" @"
# Pro 시나리오 13: AI 전환 사회 설계

2040년. 일자리 45% 소멸. AI 기본소득·AI세·AI 거버넌스.
어떤 사회를 만들 것인가?

## 기본 정보
- 참여자: 15-25명 / 기간: 3일 / 활용: 미래학·정책학·경영 대학원

## 2040년 현황
GDP +35% / 하위 40% 소득 -18% / 디지털 격차 심화

## 참여 팀
- A팀: 정부 AI위원회
- B팀: AI 기업 연합
- C팀: 노동·실직자
- D팀: 청년·미래 세대
- E팀: 철학자·윤리학자
- F팀: 언론·시민사회

## 핵심 쟁점
AI세 / 기본소득 / AI 거버넌스 / 교육 혁명 / 인간의 역할

## 실제 사례
산업혁명 비교 / 핀란드 기본소득 실험 / 에스토니아 디지털
"@
Write-Host "OK: pro/05_future/scenario_01.md"

Write-UTF8File "$base\pro\05_future\scenario_02.md" @"
# Pro 시나리오 14: 탄소중립 2050 이행

2035년. 목표까지 15년. 산업 전환 400조 원 필요.
누가 부담하는가?

## 기본 정보
- 참여자: 12-20명 / 기간: 3일 / 활용: 환경·에너지·경제 대학원

## 2035년 현황
2030년 목표 40% 감축 → 실제 28% 달성

## 참여 팀
- A팀: 기후환경부
- B팀: 산업계 연합
- C팀: 노동·지역사회
- D팀: 청년·미래 세대
- E팀: 녹색 기술·스타트업
- F팀: 언론·시민사회

## 핵심 의제
전환 속도 / 공정 전환 기금 / 탄소 가격 / 녹색 투자 / 기술 혁신

## 실제 사례
독일 에너지 전환 / 덴마크 성공 / 한국 탄소중립 현황
"@
Write-Host "OK: pro/05_future/scenario_02.md"

Write-UTF8File "$base\pro\05_future\scenario_03.md" @"
# Pro 시나리오 15: 인구 절벽 사회 적응

2045년. 인구 4,200만. 국민연금 고갈. 지방 소멸 65%.
줄어드는 사회에서 어떻게 지속될 수 있는가?

## 기본 정보
- 참여자: 12-20명 / 기간: 3일 / 활용: 행정·사회정책·도시계획 대학원

## 2045년 현황
출산율 0.65 / 65세 이상 46% / 연금 고갈 / 지방 소멸 65%

## 참여 팀
- A팀: 국토부·행안부
- B팀: 복지부·연금공단
- C팀: 이민·다문화
- D팀: 지방 소멸 지역
- E팀: 청년·미래 세대
- F팀: 경제계·AI·기술

## 핵심 쟁점
출산 vs 이민 vs 기술 / 연금 개혁 / 국토 재편 / 새로운 사회 모델

## 실제 사례
일본 축소 경험 / 독일 이민 전략 / 한국 저출산 정책 실패
"@
Write-Host "OK: pro/05_future/scenario_03.md"

# Final count
Write-Host ""
Write-Host "================================================"
Write-Host "All files created successfully!"
$count = (Get-ChildItem -Path "content\simulation" -Recurse -Filter "*.md").Count
Write-Host "Total .md files in simulation: $count"
Write-Host "Next step: Commit and push with GitHub Desktop"
Write-Host "================================================"
