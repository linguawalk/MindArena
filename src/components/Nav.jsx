import { Link, useLocation } from 'react-router-dom'

export default function Nav() {
  const loc = useLocation()
  const isLearn = loc.pathname === '/learn'

  return (
    <nav className="nav">
      <Link to="/" className="nav-logo">
        <span>Knowledge</span>Walk
        <span className="nav-sub">나만의 AI 선생님</span>
      </Link>
      <div className="nav-right">
        {!isLearn && (
          <Link to="/learn" className="nav-btn nav-btn-primary">
            문제 풀기
          </Link>
        )}
        {isLearn && (
          <Link to="/" className="nav-btn nav-btn-ghost">
            홈으로
          </Link>
        )}
      </div>
    </nav>
  )
}
