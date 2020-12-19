import { Fragment } from 'react';
import Header from '../components/Header';


export default function SignUp() {
    return (
        <Fragment>
            <Header />
            <div className="page-content">
                <div className="row">
                    <div className="col-md-6 mx-auto">
                        <form>
                        <fieldset>
                        <legend>Sign Up</legend>
                            <div class="form-group">
                                <label for="email">Your Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" />
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <label for="confirm-password">Confirm Password</label>
                                <input type="password" class="form-control" id="confirm-password" name="confirm_password" placeholder="Confirm Password" />
                            </div>
                            </fieldset>
                            <button type="submit" class="btn btn-primary float-right">Sign Up</button>
                        </form>
                    </div>
                </div>
            </div>
        </Fragment>
    )
}