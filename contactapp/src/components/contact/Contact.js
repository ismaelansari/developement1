import React from 'react'

const Contact = ({contact}) => {
    const [id,name,phone,email] = contact;
    return (
        <tr>
            <td>{id}</td>
            <td><Avatar name={name} size="50" round={true}/></td>
            <td>{name}</td>
            <td>{phone}</td>
            <td>{email}</td>
            <td><button className="btn btn-danger" onClick={deleteContact1.bind(this,id)}>Delete</button></td>
        </tr>
    )
}

export default Contact
