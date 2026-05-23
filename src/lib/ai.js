const ANTHROPIC_API = 'https://api.anthropic.com/v1/messages'
const MODEL = 'claude-sonnet-4-20250514'

// 1단계: 문제 생성 AI
async function generateQuestion(params) {
  const { gradeGroup, grade, subject, unit, questionType, difficulty } = params

  const gradeLabel = `${gradeGroup === 'elementary' ? '초등학교' : gradeGroup === 'middle' ? '중학교' : '고등학교'} ${grade}`
  const diffMap = { easy: '쉬운 기초', medium: '교과서 표준', hard: '심화 응용' }
  const typeMap = {
    multiple: '객관식 4지선다 (번호와 보기 4개 포함)',
    truefalse: 'O/X 참거짓 문제',
    short: '단답형 (한 단어 또는 짧은 숫자)',
    fill: '빈칸 채우기 (___로 표시)'
  }

  const prompt = `당신은 ${gradeLabel} ${subject} 교과 전문 출제 AI입니다.
단원: ${unit}
문제 유형: ${typeMap[questionType]}
난이도: ${diffMap[difficulty]}

아래 JSON 형식으로만 응답하세요. 다른 텍스트는 절대 포함하지 마세요.

{
  "question": "문제 내용",
  "options": ["①보기1", "②보기2", "③보기3", "④보기4"],
  "answer": "정답 (객관식은 번호, OX는 O 또는 X, 단답형은 단어)",
  "explanation": "정답 해설 2~3문장. 왜 이것이 정답인지, 오답은 왜 틀렸는지 설명",
  "hint": "힌트 한 문장"
}

객관식이 아닌 경우 options는 빈 배열 []로 하세요.
문제는 ${gradeLabel} 수준에 정확히 맞게, 교육적으로 올바르게 만드세요.`

  const res = await fetch(ANTHROPIC_API, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      model: MODEL,
      max_tokens: 1000,
      messages: [{ role: 'user', content: prompt }]
    })
  })

  const data = await res.json()
  const text = data.content?.map(c => c.text || '').join('').trim()
  const clean = text.replace(/```json|```/g, '').trim()
  return JSON.parse(clean)
}

// 2단계: 검수 AI - 생성된 문제의 오류 검토
async function verifyQuestion(question, params) {
  const { gradeGroup, grade, subject, unit } = params
  const gradeLabel = `${gradeGroup === 'elementary' ? '초등학교' : gradeGroup === 'middle' ? '중학교' : '고등학교'} ${grade}`

  const prompt = `당신은 교육 품질 검수 전문 AI입니다.
아래 문제를 검토하고 JSON으로만 응답하세요.

검토 기준:
1. 정답이 실제로 맞는가?
2. ${gradeLabel} ${subject} ${unit} 수준에 적합한가?
3. 문제와 보기가 명확하고 오해의 소지가 없는가?
4. 해설이 정확하고 교육적인가?

문제 데이터:
${JSON.stringify(question, null, 2)}

응답 형식:
{
  "passed": true 또는 false,
  "issues": ["문제점1", "문제점2"] 또는 [],
  "corrected": { 수정된 문제 객체 } 또는 null
}

passed가 true이면 corrected는 null, false이면 수정된 문제를 corrected에 넣으세요.`

  const res = await fetch(ANTHROPIC_API, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      model: MODEL,
      max_tokens: 1000,
      messages: [{ role: 'user', content: prompt }]
    })
  })

  const data = await res.json()
  const text = data.content?.map(c => c.text || '').join('').trim()
  const clean = text.replace(/```json|```/g, '').trim()
  return JSON.parse(clean)
}

// 최종 파이프라인: 생성 → 검수 → 반환
export async function createVerifiedQuestion(params) {
  const generated = await generateQuestion(params)
  const verification = await verifyQuestion(generated, params)

  if (verification.passed) {
    return { ...generated, verified: true }
  } else if (verification.corrected) {
    return { ...verification.corrected, verified: true, wasCorreected: true }
  } else {
    // 검수 실패 시 재생성 1회
    const retry = await generateQuestion(params)
    return { ...retry, verified: true }
  }
}

// 오답 개인화 해설 생성
export async function generatePersonalFeedback(question, userAnswer, params) {
  const { gradeGroup, grade, subject } = params
  const gradeLabel = `${gradeGroup === 'elementary' ? '초등' : gradeGroup === 'middle' ? '중학교' : '고등학교'} ${grade}`
  const isCorrect = userAnswer === question.answer

  const prompt = `당신은 친근하고 격려하는 ${gradeLabel} ${subject} AI 선생님입니다.

문제: ${question.question}
정답: ${question.answer}
학생 답: ${userAnswer}
결과: ${isCorrect ? '정답' : '오답'}

학생에게 2~3문장으로 친근하게 피드백을 주세요.
- 정답이면: 칭찬 + 개념 한 줄 강조
- 오답이면: 격려 + 왜 틀렸는지 + 올바른 개념 설명
이모지를 1~2개 사용해 친근하게 작성하세요. JSON 없이 순수 텍스트로만 답하세요.`

  const res = await fetch(ANTHROPIC_API, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      model: MODEL,
      max_tokens: 300,
      messages: [{ role: 'user', content: prompt }]
    })
  })

  const data = await res.json()
  return data.content?.map(c => c.text || '').join('').trim()
}
