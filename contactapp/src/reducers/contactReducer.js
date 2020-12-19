import { GET_CONTACTS ,SHOW_CONTACT,CREATE_CONTACT,UPDATE_CONTACT,DELETE_CONTACT } from "../types/contactTypes";

const initState = [
  {
    'id'    : '1',
    'name'  : 'David Warner',
    'email' : 'david@gmail.com',
    'phone' : '4454854552' 
  },
  {
    'id'    : '2',
    'name'  : 'Steave Smith',
    'email' : 'steave@gmail.com',
    'phone' : '4443454552' 
  },
  {
    'id'    : '3',
    'name'  : 'Aron Finch',
    'email' : 'aron@gmail.com',
    'phone' : '4434354552' 
  },
  {
    'id'    : '4',
    'name'  : 'Usman Khaja',
    'email' : 'usman@gmail.com',
    'phone' : '4434354223552' 
  },
  {
    'id'    : '5',
    'name'  : 'Jemes Fokner',
    'email' : 'jemes@gmail.com',
    'phone' : '4434354552' 
  },
  {
    'id'    : '6',
    'name'  : 'Glenn Mixwell',
    'email' : 'glen@gmail.com',
    'phone' : '443435453452' 
  },
  {
    'id'    : '7',
    'name'  : 'Mitchal Stark',
    'email' : 'mithaal@gmail.com',
    'phone' : '443434354552' 
  }
];

export default function contactReducer(state = initState,action){
    switch(action.type) {
        case GET_CONTACTS:
           return state;
          break;
          case SHOW_CONTACT:
            return {
                'id'    : '1',
                'name'  : 'David Warner',
                'email' : 'david@gmail.com',
                'phone' : '4454854552' 
            }
          break;
          case CREATE_CONTACT:
            return [action.payload,...state];
          break;
          case UPDATE_CONTACT:
            return state;
          break;
          case DELETE_CONTACT:
            return state.filter( contact => contact.id != action.payload );
          break;
        default:
            return state;
      }
}