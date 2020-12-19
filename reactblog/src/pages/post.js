import {Fragment} from 'react';
import Header from '../components/Header';

export default function Post(){
    return (
        <Fragment>
            <Header />
            <div className="jumbotron">
                <h1 className="display-3">Hello, world!</h1>
                <p className="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
            </div>
        </Fragment>
    )
}