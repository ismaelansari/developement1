import React from 'react'
import {NavLink,Link} from 'react-router-dom';

export const Navbar = () => {
    return (
      <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
      <Link className="navbar-brand" to="/">Navbar</Link>
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
    
      <div className="collapse navbar-collapse" id="navbarSupportedContent">
        <ul className="navbar-nav mr-auto">
        <li className="nav-item">
            <NavLink className="nav-link" to="/contacts">Contact List</NavLink>
          </li>
          <li className="nav-item">
            <NavLink className="nav-link" to="/signin">Sign In</NavLink>
          </li>
          <li className="nav-item">
            <NavLink className="nav-link" to="/signup">Sign Up</NavLink>
          </li>
          
        </ul>
      </div>
    </nav>
    )
}
