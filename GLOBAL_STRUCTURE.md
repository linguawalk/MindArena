# MindArena 글로벌 디렉토리 구조

**작성일:** 2026-06-20
**목적:** 다국가 확장을 위한 콘텐츠 폴더 구조 설계

---

## 현지화 수준 분류

```
🟢 GLOBAL  국가 무관 공통 (번역만 필요)
🟡 PARTIAL 부분 현지화 (사례·맥락 교체)
🔴 LOCAL   완전 현지화 (국가별 재제작)
```

| 트랙 | 현지화 수준 | 이유 |
|------|------------|------|
| 두뇌개발 퍼즐 | 🟢 GLOBAL | 수·논리·공간은 언어 무관 |
| 수학 | 🟢 GLOBAL | 수학은 보편 언어 |
| 과학 | 🟢 GLOBAL | 자연 법칙은 동일 |
| 프로그래밍 | 🟢 GLOBAL | 알고리즘은 동일 |
| 기술·AI | 🟡 PARTIAL | 규제·정책은 국가별 상이 |
| 음악 이론 | 🟢 GLOBAL | 악전·화성학은 공통 |
| 음악 문화 | 🟡 PARTIAL | 장르·사례 교체 필요 |
| 미술 이론 | 🟢 GLOBAL | 색채·조형 원리 공통 |
| 미술사 | 🟡 PARTIAL | 자국 미술사 강화 |
| 체육 과학 | 🟢 GLOBAL | 운동과학·역학 공통 |
| 체육 문화 | 🟡 PARTIAL | 스포츠 종목·문화 교체 |
| 인문 역사 | 🔴 LOCAL | 자국사 중심 재제작 |
| 인문 철학 | 🟡 PARTIAL | 서양철학 공통·자국철학 추가 |
| 사회 경제기초 | 🟢 GLOBAL | 미시경제 원리 공통 |
| 사회 경제심화 | 🔴 LOCAL | 자국 경제·정책 재제작 |
| 사회 정치·법 | 🔴 LOCAL | 자국 제도 재제작 |
| 사회 심리 | 🟢 GLOBAL | 인간 심리는 보편적 |
| 언어 | 🔴 LOCAL | 해당 국가 언어로 재제작 |
| 시뮬레이션 | 🟡 PARTIAL | 시나리오 맥락 교체 |
| 융합 | 🟡 PARTIAL | 개념 공통·사례 교체 |

---

## 최종 디렉토리 구조

```
MindArena/
├── api/
│   └── chat.js
│
├── content/
│   │
│   ├── _global/                    ← 🟢 모든 국가 공통
│   │   ├── puzzle/                 ← 두뇌개발 (공통)
│   │   │   ├── number/
│   │   │   ├── logic/
│   │   │   ├── language/
│   │   │   ├── probability/
│   │   │   ├── spatial/
│   │   │   ├── pattern/
│   │   │   ├── strategy/
│   │   │   ├── creative/
│   │   │   └── convergence/
│   │   │
│   │   ├── stem/                   ← 수학과학컴퓨터 (공통)
│   │   │   ├── math/curriculum.md
│   │   │   ├── science/curriculum.md
│   │   │   └── programming/curriculum.md
│   │   │
│   │   ├── arts/                   ← 예체능 이론 (공통)
│   │   │   ├── music/curriculum.md
│   │   │   ├── visual/curriculum.md
│   │   │   └── pe/curriculum.md
│   │   │
│   │   └── game_types/             ← 게임 유형 설계 (공통)
│   │       ├── design.md           ← 전체 게임 유형 설계 문서
│   │       ├── puzzle.md
│   │       ├── ai_boardgame.md
│   │       ├── casual.md
│   │       ├── card_game.md
│   │       ├── detective.md
│   │       ├── story_choice.md
│   │       ├── map_travel.md
│   │       ├── builder.md
│   │       ├── rhythm_runner.md
│   │       ├── social.md
│   │       ├── collection.md
│   │       └── simulation.md
│   │
│   ├── ko/                         ← 🇰🇷 대한민국 (현재)
│   │   ├── _meta.md                ← 국가 정보·현지화 수준
│   │   ├── tech_ai/curriculum.md   ← 🟡 한국 AI 규제·정책
│   │   ├── humanities/
│   │   │   ├── liberal_arts/curriculum.md  ← 🔴 한국사·한국철학
│   │   │   ├── social/curriculum.md        ← 🔴 한국 경제·정치
│   │   │   └── language/curriculum.md      ← 🔴 한국어
│   │   ├── convergence/curriculum.md       ← 🟡 한국 맥락 융합
│   │   └── simulation/                     ← 🟡 한국 시나리오
│   │       └── (25개 시나리오)
│   │
│   ├── fr/                         ← 🇫🇷 프랑스 (추후)
│   │   ├── _meta.md
│   │   ├── tech_ai/curriculum.md   ← EU AI법·프랑스 정책
│   │   ├── humanities/
│   │   │   ├── liberal_arts/curriculum.md  ← 프랑스사·유럽철학
│   │   │   ├── social/curriculum.md        ← 프랑스 경제·정치
│   │   │   └── language/curriculum.md      ← 프랑스어
│   │   ├── convergence/curriculum.md
│   │   └── simulation/
│   │
│   ├── us/                         ← 🇺🇸 미국 (추후)
│   │   └── (동일 구조)
│   │
│   ├── jp/                         ← 🇯🇵 일본 (추후)
│   │   └── (동일 구조)
│   │
│   ├── boardgame/                  ← 기존 보드게임 MD (추후 정리)
│   └── _standards/                 ← 콘텐츠 제작 기준
│
├── index.html
├── about.html (→ 오버레이로 통합됨)
├── vercel.json
└── README.md
```

---

## ko/_meta.md 형식

```markdown
# MindArena 한국 (KO) 메타 정보

**국가코드:** KR
**언어:** 한국어
**적용 시작:** 2025년
**현지화 담당:** MindArena Korea

## 현지화 현황

| 트랙 | 수준 | 상태 | 파일 위치 |
|------|------|------|-----------|
| 인문 | 🔴 LOCAL | ✅ 완성 | ko/humanities/liberal_arts/ |
| 사회 | 🔴 LOCAL | ✅ 완성 | ko/humanities/social/ |
| 한국어 | 🔴 LOCAL | ✅ 완성 | ko/humanities/language/ |
| 기술AI | 🟡 PARTIAL | ✅ 완성 | ko/tech_ai/ |
| 시뮬레이션 | 🟡 PARTIAL | ✅ 완성 | ko/simulation/ |
| 융합 | 🟡 PARTIAL | ✅ 완성 | ko/convergence/ |

## 글로벌 공통 트랙 (별도 현지화 불필요)

- 수학: _global/stem/math/
- 과학: _global/stem/science/
- 프로그래밍: _global/stem/programming/
- 음악: _global/arts/music/
- 미술: _global/arts/visual/
- 체육: _global/arts/pe/
- 두뇌개발: _global/puzzle/
```

---

## 현재 → 글로벌 구조 전환 계획

### 현재 구조 (단일 국가)
```
content/
  puzzle/
  stem/math/
  stem/science/
  ...
  humanities/liberal_arts/
  humanities/social/
  humanities/language/
  arts/music/
  ...
  simulation/
  boardgame/
```

### 전환 후 구조
```
content/
  _global/puzzle/         ← content/puzzle/ 이동
  _global/stem/           ← content/stem/ 이동
  _global/arts/           ← content/arts/ 이동
  _global/game_types/     ← 신규
  ko/humanities/          ← content/humanities/ 이동
  ko/tech_ai/             ← content/stem/tech_ai/ 이동
  ko/simulation/          ← content/simulation/ 이동
  ko/convergence/         ← content/convergence/ 이동
  ko/_meta.md             ← 신규
  boardgame/              ← 그대로 (추후 정리)
```

### 전환 시기
```
지금 당장: 전환 불필요
           현재 구조로 개발 계속 진행

프랑스 진출 결정 시:
  1. content/ 재구조화 (1-2일 작업)
  2. fr/ 폴더 생성
  3. 공통 콘텐츠 _global/로 이동
  4. 한국 전용 콘텐츠 ko/로 이동

이유:
  지금 구조를 바꾸면 Vercel 배포·
  index.html 내 경로 참조 모두 수정 필요
  → 불필요한 작업 발생
  → 실제 글로벌 진출 시에 전환
```

---

## 글로벌 확장 시 재활용 비율

```
국가        공통 재활용    부분 수정    완전 재제작
──────────  ────────────   ─────────    ───────────
프랑스      55%            20%          25%
미국        60%            20%          20%
일본        55%            20%          25%
중국        50%            20%          30%
독일        55%            20%          25%

재제작 필요 항목 (항상):
  역사 트랙 (자국사)
  언어 트랙 (자국어)
  사회 정치·법 (자국 제도)
  사회 경제심화 (자국 경제)
```

---

## 파일 구조 (GitHub)

```
지금 업로드할 파일:
  content/_global/game_types/design.md  ← 게임 유형 설계
  content/ko/_meta.md                   ← 한국 메타 정보
  GLOBAL_STRUCTURE.md                   ← 이 파일 (루트에)
```
