import {React,Fragment} from 'react';
import { Provider } from 'react-redux';
import { BrowserRouter as Router , Switch , Route } from 'react-router-dom';
import { applyMiddleware, createStore } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';
import Contacts from './components/contact/Contacts';
import { Navbar } from './components/layouts/Navbar';
import AddContact from './components/pages/AddContact';
import EditContact from './components/pages/EditContact';
import Index from './components/pages/Index';
import SignIn from './components/pages/SignIn';
import SignUp from './components/pages/SignUp';
import { rootReducer } from './reducers/rootReducer';

const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)));

  function App() {
    return (
      <Fragment>
        <Provider store={store}>
          <Router>
            <Navbar/>
            <div className="container my-5">
                <Switch>
                    <Route exact path="/" component={Index}/>
                    <Route exact path="/signin" component={SignIn}/>
                    <Route exact path="/add/contact" component={AddContact}/>
                    <Route exact path="/edit/contact/:id" component={EditContact}/>
                    <Route exact path="/signup" component={SignUp}/>
                    <Route exact path="/contacts" component={Contacts}/>
                </Switch>
            </div>
          </Router>
        </Provider>
      </Fragment>
    );
  }



export default App;
