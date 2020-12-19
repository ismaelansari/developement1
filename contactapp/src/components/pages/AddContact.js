import {Fragment, React,useState }from 'react';
import {useDispatch} from 'react-redux';
import { Link, useHistory } from 'react-router-dom';
import shortid from 'shortid';
import { createContact } from '../../actions/contactActions';

const AddContact = () => {

    const dispatch = useDispatch();

    const history  = useHistory();

    const [inputFiels,setInputFiels] = useState({
        id    : shortid.generate(),
        name  : '',
        phone : '',
        email : ''
    });

    const handleInputField = (e) => {
        const name  = e.target.name;
        const value = e.target.value;
        setInputFiels({
           ...inputFiels,
           [name] : value
        });
    }

    const handleSubmit = e => {
        e.preventDefault();
        dispatch(createContact(inputFiels));
        history.push('/contacts');
    }

    return (
        <Fragment>
            <div className="card">
                <div className="card-header">Add Contact</div>
                <div className="card-body">
                    <form className="form" onSubmit={handleSubmit} method="post">
                    <div className="form-group">
                        <input type="text" name="name" className="form-control" onChange={handleInputField} value={inputFiels.name} placeholder="Name" />
                    </div>
                    <div className="form-group">
                        <input type="number" name="phone" className="form-control" onChange={handleInputField} value={inputFiels.phone} placeholder="Phone"/>
                    </div>
                    <div className="form-group">
                        <input type="email" name="email" className="form-control" onChange={handleInputField} value={inputFiels.email} placeholder="Email"/>
                    </div>
                    <input type="submit" className="btn btn-primary" value="Add" />
                    </form>
                </div>
            </div>
            <br/>
            <div className="row">
              <div className="col-md-12 text-right">
                <Link to="/contacts" className="btn btn-primary">Back</Link>
              </div>
            </div>
        </Fragment>
    )
}

export default AddContact
