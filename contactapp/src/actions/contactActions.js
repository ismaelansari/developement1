import axios from "axios";
import { baseUrl } from "../globalConstants";
import { GET_CONTACTS ,SHOW_CONTACT,CREATE_CONTACT,UPDATE_CONTACT,DELETE_CONTACT } from "../types/contactTypes";


export const getContacts = () => {
    return {
      type : GET_CONTACTS
    }
}

export const createContact =(payload) => {
    return {
        type : CREATE_CONTACT,
        payload : payload
    };
}

export const updateContact =(payload) => {
    return {
        type : UPDATE_CONTACT,
        payload : payload
    };
}

export const showContact =(payload) => {
    return {
        type : SHOW_CONTACT,
        payload : payload
    };
}

export const deleteContact =(payload) => {
    return {
        type : DELETE_CONTACT,
        payload : payload
    };
}