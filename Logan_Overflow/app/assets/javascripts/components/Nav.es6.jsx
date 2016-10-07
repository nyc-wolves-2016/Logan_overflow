class Nav extends React.Component {
  render(){
    return(<nav className='nav-main'>
      <ul className="list-nav">
        <li className="list-item-nav"> <a href="">Username</a> </li>
        <li className="list-item-nav"> <a href="/logout">Logout</a> </li>
        <li className="list-item-nav"> <a href="/register">Register</a> </li>
        <li className="list-item-nav"> <a href="/login">Login</a> </li>
        <li className="list-item-nav"> <a href="/">Home</a> </li>
      </ul>
    </nav>
    )
  }
}
