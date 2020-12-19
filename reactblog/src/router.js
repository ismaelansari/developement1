import {BrowserRouter as Router,Switch,Route} from "react-router-dom";

import Index   from './pages/index';
import SignIn  from './pages/signin';
import SignUp  from './pages/signup';
import Posts   from './pages/posts';
import Post   from './pages/post';

export default function() {
  return (
    <Router>
        <Switch>
            <Route exact path="/" component={Index} />
            <Route exact path="/signin" component={SignIn} />
            <Route exact path="/signup" component={SignUp} />
            <Route exact path="/posts"  component={Posts} />
            <Route exact path="/post/:post"  component={Post} />
        </Switch>
    </Router>
  );
}