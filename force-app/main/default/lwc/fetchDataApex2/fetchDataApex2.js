import { LightningElement, wire } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactController.getAllContacts';

export default class FetchDataApex2 extends LightningElement {
    someName = '';
   

    handleChange(event){
        if(event.target.value != null){
        this.someName = event.target.value;
        console.log(this.someName);
        }
    }

    @wire(getAllContacts, {someName: '$someName'}) 
    contacts;

    get contactsList(){
        if(this.contacts){
            return true;
        }
        return false;
    }

}