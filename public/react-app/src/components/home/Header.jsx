import React from 'react'
import { Link } from 'react-router-dom'

const Header = () => {
  return (
    <header className='header'>
        <div>Header</div>
        <Link to='/login'>login</Link>
    </header>
    
    
  )
}

export default Header