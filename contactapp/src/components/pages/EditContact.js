import {Fragment, React,useState,useEffect }from 'react';
import {useSelector,useDispatch} from 'react-redux';
import { Link, useHistory, useParams } from 'react-router-dom';
import { showContact, updateContact } from '../../actions/contactActions';

const EditContact = () => {

    const dispatch = useDispatch();
    
    const contact  = useSelector(state => state.contact);

    const history  = useHistory();
    
    const { id }     = useParams();

    const [inputFiels,setInputFiels] = useState({
        id    : '',
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
        dispatch(updateContact(inputFiels));
        history.push('/contacts');
    }

    useEffect(() => {
      if(contact != null){
        setInputFiels(()=>{
            return contact;
        })
      }
     dispatch(showContact(id));
    },[contact])

    return (
        <Fragment>
            <div className="card">
                <div className="card-header">Update Contact</div>
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
                    <input type="submit" className="btn btn-primary" value="Update" />
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

export default EditContact
