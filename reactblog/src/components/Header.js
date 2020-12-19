import { Link } from "react-router-dom";

export default function Header(){
    return (
            <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
            <Link className="navbar-brand" to="/">ReactBlog</Link>
            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarColor01">
                <ul className="navbar-nav mr-auto">
                <li className="nav-item active">
                    <Link className="navbar-brand" to="/">Home</Link>
                </li>
                <li className="nav-item">
                    <Link className="navbar-brand" to="/posts">Posts</Link>
                </li>
                <li className="nav-item">
                    <Link className="navbar-brand" to="/signin">Sign In</Link>
                </li>
                <li className="nav-item">
                    <Link className="navbar-brand" to="/signup">Sign Up</Link>
                </li>
                </ul>
            </div>
            </nav>
    )
}