import { useNavigate } from 'react-router-dom'
import { SUBJECTS } from '../lib/curriculum'

export default function Landing() {
  const navigate = useNavigate()

  const features = [
    { icon: '🤖', title: 'AI가 문제를 만들어요', desc: '과목·단원·난이도를 선택하면 AI가 즉시 맞춤 문제를 생성합니다. 매번 새로운 문제가 나옵니다.' },
    { icon: '✅', title: '이중 검수 시스템', desc: '생성 AI와 검수 AI가 함께 작동해 오류 없는 정확한 문제만 제공됩니다.' },
    { icon: '💡', title: '개인 맞춤 해설', desc: '틀린 문제마다 왜 틀렸는지 AI 선생님이 친근하게 설명해드립니다.' },
    { icon: '📱', title: '언제 어디서나', desc: '웹과 모바일 앱으로 쉬는 시간, 이동 중에도 5분씩 학습할 수 있습니다.' }
  ]

  return (
    <div>
      {/* HERO */}
      <section style={{
        background: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%)',
        color: '#fff',
        padding: '5rem 1.25rem 4rem',
        textAlign: 'center',
        position: 'relative',
        overflow: 'hidden'
      }}>
        <div style={{
          position: 'absolute', inset: 0,
          backgroundImage: 'radial-gradient(circle at 20% 50%, rgba(79,142,247,0.15) 0%, transparent 50%), radial-gradient(circle at 80% 20%, rgba(124,58,237,0.1) 0%, transparent 40%)',
          pointerEvents: 'none'
        }} />
        <div style={{ position: 'relative', maxWidth: 700, margin: '0 auto' }}>
          <div style={{
            display: 'inline-flex', alignItems: 'center', gap: 8,
            background: 'rgba(79,142,247,0.15)', border: '1px solid rgba(79,142,247,0.3)',
            borderRadius: 100, padding: '5px 16px', marginBottom: '1.5rem',
            fontSize: '0.8rem', color: 'rgba(255,255,255,0.85)'
          }}>
            ✨ AI 이중 검수 시스템 탑재
          </div>
          <h1 style={{
            fontFamily: 'var(--font-display)',
            fontSize: 'clamp(2rem, 5vw, 3.2rem)',
            fontWeight: 700, lineHeight: 1.2,
            marginBottom: '1rem'
          }}>
            나만의 AI 선생님<br />
            <span style={{ color: '#4f8ef7' }}>KnowledgeWalk</span>
          </h1>
          <p style={{
            fontSize: 'clamp(0.95rem, 2vw, 1.1rem)',
            color: 'rgba(255,255,255,0.7)',
            lineHeight: 1.7, marginBottom: '2.5rem'
          }}>
            초·중·고 전 과목, 과목과 단원을 선택하면<br />
            AI가 즉시 맞춤 문제를 만들어드립니다.
          </p>
          <div style={{ display: 'flex', gap: 12, justifyContent: 'center', flexWrap: 'wrap' }}>
            <button className="btn btn-primary btn-lg" onClick={() => navigate('/learn')}>
              무료로 시작하기 →
            </button>
            <button className="btn btn-outline btn-lg" style={{ borderColor: 'rgba(255,255,255,0.3)', color: '#fff' }}
              onClick={() => navigate('/learn')}>
              둘러보기
            </button>
          </div>
          <p style={{ marginTop: '1.2rem', fontSize: '0.78rem', color: 'rgba(255,255,255,0.4)' }}>
            신용카드 불필요 · 회원가입 없이 체험 가능
          </p>
        </div>
      </section>

      {/* SUBJECTS GRID */}
      <section className="section">
        <div className="container">
          <h2 className="section-title" style={{ textAlign: 'center' }}>7개 과목 전체 커버</h2>
          <p className="section-sub" style={{ textAlign: 'center' }}>초등·중학·고등 모든 학년, 모든 과목의 AI 문제를 즉시 생성합니다</p>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(130px, 1fr))', gap: 12 }}>
            {Object.entries(SUBJECTS).map(([key, s]) => (
              <button key={key} className="card card-hover"
                style={{ padding: '1.2rem 1rem', textAlign: 'center', border: 'none', background: 'var(--bg-card)', cursor: 'pointer' }}
                onClick={() => navigate('/learn')}>
                <div style={{ fontSize: '2rem', marginBottom: 8 }}>{s.icon}</div>
                <div style={{ fontWeight: 600, fontSize: '0.9rem', color: s.color }}>{s.label}</div>
                <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', marginTop: 4 }}>
                  {Object.keys(s.units).length * 6}개+ 단원
                </div>
              </button>
            ))}
          </div>
        </div>
      </section>

      {/* FEATURES */}
      <section className="section" style={{ background: '#fff' }}>
        <div className="container">
          <h2 className="section-title" style={{ textAlign: 'center' }}>왜 KnowledgeWalk인가요?</h2>
          <p className="section-sub" style={{ textAlign: 'center' }}>기존 문제은행과 다릅니다</p>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))', gap: 20 }}>
            {features.map((f, i) => (
              <div key={i} className="card" style={{ padding: '1.5rem' }}>
                <div style={{ fontSize: '2rem', marginBottom: '0.75rem' }}>{f.icon}</div>
                <h3 style={{ fontSize: '1rem', fontWeight: 600, marginBottom: '0.5rem' }}>{f.title}</h3>
                <p style={{ fontSize: '0.85rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>{f.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* HOW IT WORKS */}
      <section className="section">
        <div className="container-sm">
          <h2 className="section-title" style={{ textAlign: 'center' }}>이렇게 사용해요</h2>
          <p className="section-sub" style={{ textAlign: 'center' }}>3단계로 바로 시작</p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
            {[
              { step: '01', title: '학년·과목·단원 선택', desc: '초등 / 중학 / 고등 학년과 공부할 과목, 단원을 고릅니다.' },
              { step: '02', title: 'AI가 즉시 문제 생성', desc: '생성 AI가 문제를 만들고, 검수 AI가 오류를 검토합니다. 매번 새로운 문제!' },
              { step: '03', title: '풀고 → AI 해설 확인', desc: '정답을 제출하면 왜 맞고 틀렸는지 AI 선생님이 친근하게 설명해드려요.' }
            ].map((s, i) => (
              <div key={i} style={{ display: 'flex', gap: 16, alignItems: 'flex-start' }}>
                <div style={{
                  width: 44, height: 44, borderRadius: '50%',
                  background: 'var(--primary)', color: '#fff',
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontFamily: 'var(--font-display)', fontWeight: 700, fontSize: '0.85rem',
                  flexShrink: 0
                }}>{s.step}</div>
                <div className="card" style={{ flex: 1, padding: '1rem 1.25rem' }}>
                  <div style={{ fontWeight: 600, marginBottom: 4 }}>{s.title}</div>
                  <div style={{ fontSize: '0.85rem', color: 'var(--text-secondary)' }}>{s.desc}</div>
                </div>
              </div>
            ))}
          </div>
          <div style={{ textAlign: 'center', marginTop: '2.5rem' }}>
            <button className="btn btn-primary btn-lg" onClick={() => navigate('/learn')}>
              지금 바로 문제 풀기 →
            </button>
          </div>
        </div>
      </section>

      {/* FOOTER */}
      <footer style={{
        background: 'var(--primary)', color: 'rgba(255,255,255,0.5)',
        padding: '2rem 1.25rem', textAlign: 'center', fontSize: '0.8rem'
      }}>
        <div style={{ fontFamily: 'var(--font-display)', color: '#fff', fontWeight: 600, marginBottom: 8 }}>
          KnowledgeWalk
        </div>
        <div>나만의 AI 선생님 · knowledgewalk.net</div>
        <div style={{ marginTop: 8 }}>© 2025 KnowledgeWalk. All rights reserved.</div>
      </footer>
    </div>
  )
}
