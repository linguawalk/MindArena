import { useState } from 'react'
import { GRADES, SUBJECTS, QUESTION_TYPES, DIFFICULTY_LEVELS } from '../lib/curriculum'
import { createVerifiedQuestion, generatePersonalFeedback } from '../lib/ai'

const STEPS = { SELECT: 'select', LOADING: 'loading', QUESTION: 'question', RESULT: 'result' }

export default function Learn() {
  const [step, setStep] = useState(STEPS.SELECT)
  const [params, setParams] = useState({
    gradeGroup: '', grade: '', subject: '', subjectKey: '', unit: '',
    questionType: 'multiple', difficulty: 'medium'
  })
  const [question, setQuestion] = useState(null)
  const [selected, setSelected] = useState(null)
  const [submitted, setSubmitted] = useState(false)
  const [feedback, setFeedback] = useState('')
  const [loadingFeedback, setLoadingFeedback] = useState(false)
  const [score, setScore] = useState({ correct: 0, total: 0 })
  const [error, setError] = useState('')

  const currentSubject = params.subjectKey ? SUBJECTS[params.subjectKey] : null
  const units = currentSubject && params.gradeGroup
    ? currentSubject.units[params.gradeGroup] || []
    : []

  const isReady = params.gradeGroup && params.grade && params.subjectKey && params.unit

  async function startQuestion() {
    setStep(STEPS.LOADING)
    setError('')
    try {
      const q = await createVerifiedQuestion({
        ...params,
        subject: currentSubject.label
      })
      setQuestion(q)
      setSelected(null)
      setSubmitted(false)
      setFeedback('')
      setStep(STEPS.QUESTION)
    } catch (e) {
      setError('문제 생성 중 오류가 발생했습니다. 다시 시도해주세요.')
      setStep(STEPS.SELECT)
    }
  }

  async function submitAnswer() {
    if (!selected && params.questionType !== 'short') return
    setSubmitted(true)
    const isCorrect = selected === question.answer
    setScore(s => ({ correct: s.correct + (isCorrect ? 1 : 0), total: s.total + 1 }))
    setLoadingFeedback(true)
    try {
      const fb = await generatePersonalFeedback(question, selected, {
        ...params, subject: currentSubject.label
      })
      setFeedback(fb)
    } catch (e) {
      setFeedback(isCorrect ? '정답입니다! 잘 했어요. 🎉' : `아쉽네요. 정답은 "${question.answer}"입니다.`)
    }
    setLoadingFeedback(false)
  }

  function nextQuestion() {
    setStep(STEPS.LOADING)
    startQuestion()
  }

  function reset() {
    setStep(STEPS.SELECT)
    setScore({ correct: 0, total: 0 })
    setParams(p => ({ ...p, unit: '', grade: '' }))
  }

  const isCorrect = submitted && selected === question?.answer

  return (
    <div style={{ minHeight: 'calc(100vh - var(--nav-height))', background: 'var(--bg)' }}>
      <div className="container-sm" style={{ padding: '2rem 1.25rem' }}>

        {/* HEADER */}
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '1.5rem' }}>
          <div>
            <h1 style={{ fontFamily: 'var(--font-display)', fontSize: '1.4rem', fontWeight: 600 }}>
              AI 문제 풀기
            </h1>
            <p style={{ fontSize: '0.82rem', color: 'var(--text-muted)', marginTop: 2 }}>
              과목과 단원을 선택하면 AI가 즉시 문제를 만들어드려요
            </p>
          </div>
          {score.total > 0 && (
            <div style={{
              background: 'var(--bg-card)', border: '1px solid var(--border)',
              borderRadius: 'var(--radius-md)', padding: '8px 16px', textAlign: 'center'
            }}>
              <div style={{ fontFamily: 'var(--font-display)', fontWeight: 700, fontSize: '1.2rem', color: 'var(--accent)' }}>
                {score.correct}/{score.total}
              </div>
              <div style={{ fontSize: '0.7rem', color: 'var(--text-muted)' }}>맞힌 문제</div>
            </div>
          )}
        </div>

        {/* STEP 1: SELECT */}
        {(step === STEPS.SELECT || step === STEPS.LOADING) && (
          <div className="fade-up">
            {/* 학교급 */}
            <div className="card" style={{ padding: '1.25rem', marginBottom: 12 }}>
              <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 10, letterSpacing: '0.06em' }}>
                STEP 1 · 학교급 선택
              </div>
              <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                {Object.entries(GRADES).map(([key, g]) => (
                  <button key={key}
                    style={{
                      padding: '8px 20px', borderRadius: 100,
                      border: `1.5px solid ${params.gradeGroup === key ? 'var(--accent)' : 'var(--border)'}`,
                      background: params.gradeGroup === key ? 'var(--accent-soft)' : 'transparent',
                      color: params.gradeGroup === key ? 'var(--accent-hover)' : 'var(--text-secondary)',
                      fontWeight: 500, fontSize: '0.88rem', cursor: 'pointer', transition: 'all 0.15s'
                    }}
                    onClick={() => setParams(p => ({ ...p, gradeGroup: key, grade: '', unit: '' }))}>
                    {g.label}
                  </button>
                ))}
              </div>

              {params.gradeGroup && (
                <div style={{ marginTop: 12, display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                  {GRADES[params.gradeGroup].levels.map(lv => (
                    <button key={lv}
                      style={{
                        padding: '6px 16px', borderRadius: 100, fontSize: '0.82rem',
                        border: `1.5px solid ${params.grade === lv ? 'var(--accent)' : 'var(--border)'}`,
                        background: params.grade === lv ? 'var(--accent-soft)' : 'transparent',
                        color: params.grade === lv ? 'var(--accent-hover)' : 'var(--text-secondary)',
                        fontWeight: 500, cursor: 'pointer', transition: 'all 0.15s'
                      }}
                      onClick={() => setParams(p => ({ ...p, grade: lv }))}>
                      {lv}
                    </button>
                  ))}
                </div>
              )}
            </div>

            {/* 과목 */}
            <div className="card" style={{ padding: '1.25rem', marginBottom: 12 }}>
              <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 10, letterSpacing: '0.06em' }}>
                STEP 2 · 과목 선택
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(90px, 1fr))', gap: 8 }}>
                {Object.entries(SUBJECTS).map(([key, s]) => (
                  <button key={key}
                    style={{
                      padding: '10px 8px', borderRadius: 'var(--radius-md)', textAlign: 'center',
                      border: `1.5px solid ${params.subjectKey === key ? s.color : 'var(--border)'}`,
                      background: params.subjectKey === key ? s.color + '15' : 'transparent',
                      cursor: 'pointer', transition: 'all 0.15s'
                    }}
                    onClick={() => setParams(p => ({ ...p, subjectKey: key, unit: '' }))}>
                    <div style={{ fontSize: '1.4rem' }}>{s.icon}</div>
                    <div style={{ fontSize: '0.78rem', fontWeight: 600, color: params.subjectKey === key ? s.color : 'var(--text-secondary)', marginTop: 4 }}>
                      {s.label}
                    </div>
                  </button>
                ))}
              </div>
            </div>

            {/* 단원 */}
            {units.length > 0 && (
              <div className="card" style={{ padding: '1.25rem', marginBottom: 12 }}>
                <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 10, letterSpacing: '0.06em' }}>
                  STEP 3 · 단원 선택
                </div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
                  {units.map(u => (
                    <button key={u}
                      style={{
                        padding: '7px 16px', borderRadius: 100, fontSize: '0.82rem',
                        border: `1.5px solid ${params.unit === u ? 'var(--accent)' : 'var(--border)'}`,
                        background: params.unit === u ? 'var(--accent-soft)' : 'transparent',
                        color: params.unit === u ? 'var(--accent-hover)' : 'var(--text-secondary)',
                        fontWeight: 500, cursor: 'pointer', transition: 'all 0.15s'
                      }}
                      onClick={() => setParams(p => ({ ...p, unit: u }))}>
                      {u}
                    </button>
                  ))}
                </div>
              </div>
            )}

            {/* 문제 유형 & 난이도 */}
            {isReady && (
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 12 }}>
                <div className="card" style={{ padding: '1.25rem' }}>
                  <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 10, letterSpacing: '0.06em' }}>
                    문제 유형
                  </div>
                  {QUESTION_TYPES.map(t => (
                    <button key={t.id}
                      style={{
                        display: 'block', width: '100%', textAlign: 'left',
                        padding: '8px 12px', borderRadius: 'var(--radius-sm)', marginBottom: 4,
                        border: `1.5px solid ${params.questionType === t.id ? 'var(--accent)' : 'transparent'}`,
                        background: params.questionType === t.id ? 'var(--accent-soft)' : 'transparent',
                        cursor: 'pointer', transition: 'all 0.15s'
                      }}
                      onClick={() => setParams(p => ({ ...p, questionType: t.id }))}>
                      <div style={{ fontSize: '0.82rem', fontWeight: 600, color: params.questionType === t.id ? 'var(--accent-hover)' : 'var(--text-primary)' }}>{t.label}</div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)' }}>{t.desc}</div>
                    </button>
                  ))}
                </div>
                <div className="card" style={{ padding: '1.25rem' }}>
                  <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 10, letterSpacing: '0.06em' }}>
                    난이도
                  </div>
                  {DIFFICULTY_LEVELS.map(d => (
                    <button key={d.id}
                      style={{
                        display: 'block', width: '100%', textAlign: 'left',
                        padding: '8px 12px', borderRadius: 'var(--radius-sm)', marginBottom: 4,
                        border: `1.5px solid ${params.difficulty === d.id ? 'var(--accent)' : 'transparent'}`,
                        background: params.difficulty === d.id ? 'var(--accent-soft)' : 'transparent',
                        cursor: 'pointer', transition: 'all 0.15s'
                      }}
                      onClick={() => setParams(p => ({ ...p, difficulty: d.id }))}>
                      <div style={{ fontSize: '0.85rem', fontWeight: 600, color: params.difficulty === d.id ? 'var(--accent-hover)' : 'var(--text-primary)' }}>{d.label}</div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)' }}>{d.desc}</div>
                    </button>
                  ))}
                </div>
              </div>
            )}

            {error && (
              <div style={{ background: 'var(--danger-soft)', color: 'var(--danger)', padding: '12px 16px', borderRadius: 'var(--radius-md)', fontSize: '0.85rem', marginBottom: 12 }}>
                {error}
              </div>
            )}

            <button className="btn btn-primary btn-lg" style={{ width: '100%' }}
              disabled={!isReady || step === STEPS.LOADING}
              onClick={startQuestion}>
              {step === STEPS.LOADING
                ? <><div className="loading-spinner" style={{ width: 20, height: 20, borderWidth: 2 }} /> AI가 문제를 만드는 중...</>
                : '🤖 AI 문제 생성하기'}
            </button>
          </div>
        )}

        {/* STEP 2: QUESTION */}
        {step === STEPS.QUESTION && question && (
          <div className="fade-up">
            {/* 문제 헤더 */}
            <div style={{ display: 'flex', gap: 8, marginBottom: 16, flexWrap: 'wrap' }}>
              <span className="badge badge-blue">{currentSubject?.label}</span>
              <span className="badge badge-blue">{params.grade} · {params.unit}</span>
              <span className="badge badge-yellow">
                {DIFFICULTY_LEVELS.find(d => d.id === params.difficulty)?.label}
              </span>
              <span className="badge badge-green">✅ AI 검수 완료</span>
            </div>

            {/* 문제 카드 */}
            <div className="card" style={{ padding: '1.5rem', marginBottom: 16 }}>
              <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', marginBottom: 12, fontWeight: 600 }}>
                {QUESTION_TYPES.find(t => t.id === params.questionType)?.label}
              </div>
              <p style={{ fontSize: '1.05rem', fontWeight: 500, lineHeight: 1.7, color: 'var(--text-primary)' }}>
                {question.question}
              </p>

              {/* 힌트 */}
              {!submitted && question.hint && (
                <details style={{ marginTop: 16 }}>
                  <summary style={{ fontSize: '0.8rem', color: 'var(--text-muted)', cursor: 'pointer' }}>
                    💡 힌트 보기
                  </summary>
                  <p style={{ marginTop: 8, fontSize: '0.85rem', color: 'var(--text-secondary)', background: 'var(--warning-soft)', padding: '8px 12px', borderRadius: 'var(--radius-sm)' }}>
                    {question.hint}
                  </p>
                </details>
              )}
            </div>

            {/* 보기 (객관식) */}
            {params.questionType === 'multiple' && question.options?.length > 0 && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 10, marginBottom: 16 }}>
                {question.options.map((opt, i) => {
                  let borderColor = 'var(--border)'
                  let bg = 'var(--bg-card)'
                  let color = 'var(--text-primary)'
                  if (selected === opt && !submitted) { borderColor = 'var(--accent)'; bg = 'var(--accent-soft)'; color = 'var(--accent-hover)' }
                  if (submitted && opt === question.answer) { borderColor = 'var(--success)'; bg = 'var(--success-soft)'; color = 'var(--success)' }
                  if (submitted && opt === selected && opt !== question.answer) { borderColor = 'var(--danger)'; bg = 'var(--danger-soft)'; color = 'var(--danger)' }
                  return (
                    <button key={i}
                      style={{
                        padding: '12px 16px', borderRadius: 'var(--radius-md)',
                        border: `1.5px solid ${borderColor}`, background: bg,
                        color, textAlign: 'left', fontSize: '0.9rem', fontFamily: 'var(--font-body)',
                        cursor: submitted ? 'default' : 'pointer', transition: 'all 0.15s', lineHeight: 1.5
                      }}
                      disabled={submitted}
                      onClick={() => !submitted && setSelected(opt)}>
                      {opt}
                    </button>
                  )
                })}
              </div>
            )}

            {/* OX */}
            {params.questionType === 'truefalse' && (
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 16 }}>
                {['O', 'X'].map(v => {
                  let bg = selected === v ? (v === 'O' ? 'var(--success-soft)' : 'var(--danger-soft)') : 'var(--bg-card)'
                  if (submitted && v === question.answer) bg = 'var(--success-soft)'
                  if (submitted && v === selected && v !== question.answer) bg = 'var(--danger-soft)'
                  return (
                    <button key={v}
                      style={{
                        padding: '1.5rem', borderRadius: 'var(--radius-lg)', border: `2px solid ${selected === v ? (v === 'O' ? 'var(--success)' : 'var(--danger)') : 'var(--border)'}`,
                        background: bg, fontSize: '2.5rem', cursor: submitted ? 'default' : 'pointer', transition: 'all 0.15s',
                        fontWeight: 700, color: v === 'O' ? 'var(--success)' : 'var(--danger)'
                      }}
                      disabled={submitted}
                      onClick={() => !submitted && setSelected(v)}>
                      {v}
                    </button>
                  )
                })}
              </div>
            )}

            {/* 단답형 */}
            {(params.questionType === 'short' || params.questionType === 'fill') && !submitted && (
              <div style={{ marginBottom: 16 }}>
                <input
                  type="text" placeholder="답을 입력하세요..."
                  value={selected || ''}
                  onChange={e => setSelected(e.target.value)}
                  onKeyDown={e => e.key === 'Enter' && selected && submitAnswer()}
                  style={{
                    width: '100%', padding: '12px 16px', fontSize: '1rem',
                    border: '1.5px solid var(--border)', borderRadius: 'var(--radius-md)',
                    background: 'var(--bg-card)', fontFamily: 'var(--font-body)'
                  }}
                />
              </div>
            )}

            {/* 제출 버튼 */}
            {!submitted && (
              <button className="btn btn-primary" style={{ width: '100%', padding: '14px' }}
                disabled={!selected}
                onClick={submitAnswer}>
                정답 제출하기
              </button>
            )}

            {/* 결과 */}
            {submitted && (
              <div className="fade-up">
                <div style={{
                  padding: '1.25rem', borderRadius: 'var(--radius-lg)', marginBottom: 12,
                  background: isCorrect ? 'var(--success-soft)' : 'var(--danger-soft)',
                  border: `1.5px solid ${isCorrect ? 'var(--success)' : 'var(--danger)'}`
                }}>
                  <div style={{ fontWeight: 700, fontSize: '1.1rem', color: isCorrect ? 'var(--success)' : 'var(--danger)', marginBottom: 8 }}>
                    {isCorrect ? '🎉 정답입니다!' : '❌ 오답입니다'}
                  </div>
                  {!isCorrect && (
                    <div style={{ fontSize: '0.88rem', color: 'var(--text-secondary)', marginBottom: 8 }}>
                      정답: <strong style={{ color: 'var(--success)' }}>{question.answer}</strong>
                    </div>
                  )}
                  {loadingFeedback
                    ? <div style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: '0.85rem', color: 'var(--text-muted)' }}>
                        <div className="loading-spinner" style={{ width: 16, height: 16, borderWidth: 2 }} /> AI 선생님이 해설을 작성 중...
                      </div>
                    : <p style={{ fontSize: '0.88rem', color: 'var(--text-secondary)', lineHeight: 1.7 }}>{feedback}</p>
                  }
                </div>

                {/* 해설 */}
                <div className="card" style={{ padding: '1.25rem', marginBottom: 16 }}>
                  <div style={{ fontSize: '0.75rem', fontWeight: 600, color: 'var(--text-muted)', marginBottom: 8 }}>📝 문제 해설</div>
                  <p style={{ fontSize: '0.88rem', lineHeight: 1.7, color: 'var(--text-secondary)' }}>{question.explanation}</p>
                </div>

                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10 }}>
                  <button className="btn btn-outline" onClick={reset}>처음으로</button>
                  <button className="btn btn-primary" onClick={nextQuestion}>다음 문제 →</button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
