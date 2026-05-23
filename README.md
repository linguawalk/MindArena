# KnowledgeWalk — 나만의 AI 선생님

초·중·고 전 과목 AI 문제 생성 학습 플랫폼

## 주요 기능
- 7개 과목 × 초·중·고 전 학년 문제 생성
- 생성 AI + 검수 AI 이중 파이프라인
- 객관식 / OX / 단답형 / 빈칸채우기 4가지 유형
- 3단계 난이도 (쉬움 / 보통 / 어려움)
- AI 개인화 오답 해설
- PWA (모바일 앱처럼 설치 가능)

---

## 로컬 개발 실행

```bash
npm install
npm run dev
```

---

## Vercel 배포 방법 (knowledgewalk.net 연결)

### 1단계: GitHub에 올리기
```bash
git init
git add .
git commit -m "첫 배포"
git remote add origin https://github.com/YOUR_USERNAME/knowledgewalk.git
git push -u origin main
```

### 2단계: Vercel 배포
1. https://vercel.com 접속 → GitHub로 로그인
2. "New Project" → knowledgewalk 저장소 선택
3. Framework: Vite 자동 감지됨
4. "Deploy" 클릭

### 3단계: 환경변수 설정
Vercel 대시보드 → Settings → Environment Variables:
```
VITE_ANTHROPIC_API_KEY=sk-ant-xxxxx
```

### 4단계: 도메인 연결
Vercel 대시보드 → Settings → Domains:
- `knowledgewalk.net` 추가
- 도메인 등록업체에서 DNS 설정:
  - A 레코드: `76.76.21.21`
  - CNAME: `cname.vercel-dns.com`

---

## API 키 발급
https://console.anthropic.com 에서 API 키 생성

## 기술 스택
- React 18 + Vite
- React Router v6
- Claude API (claude-sonnet-4)
- Vercel (호스팅)
- PWA (모바일 설치)
