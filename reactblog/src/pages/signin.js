import { Fragment , useState, useEffect } from 'react';
import Header from '../components/Header';


export default function SignIn() {

    const [inputs, setInputs] = useState({
        username: 'shivamyadav8959@gmail.com',
        password: '12345678'
    });

    function handleChange(e) {
        const { name, value } = e.target;
        setInputs(inputs => ({ ...inputs, [name]: value }));
    }

    return (
        <Fragment>
            <Header />
            <div className="page-content">
                <div className="row">
                    <div className="col-md-6 mx-auto">
                        <form>
                        <fieldset>
                        <legend>Login</legend>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" value={inputs.username} name="email" aria-describedby="emailHelp" placeholder="Enter email" />
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" value={inputs.password} name="password" placeholder="Password" />
                            </div>
                            </fieldset>
                            <button type="submit" class="btn btn-primary float-right">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </Fragment>
    )
}