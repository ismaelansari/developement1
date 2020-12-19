import {Fragment} from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/Header';

const posts = [
   {
   },
   {

   },
   {

   }
   
];

export default function Posts() {
    return ( 
        <Fragment>
            <Header />
            <div class="page-content">
                <div className="row">
                    {
                        posts.map(function(post){
                            return (
                                <div className="col-md-3">
                                    <Link to="post/post-name">
                                        <div className="card text-primary bg-default mb-3">
                                            <div className="card-header">Header</div>
                                            <div className="card-body">
                                                <h4 className="card-title">Secondary card title</h4>
                                                <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            </div>
                                        </div>
                                    </Link>
                                </div>
                            )
                        })
                    }
                </div>
            </div>
        </Fragment>
    )
}