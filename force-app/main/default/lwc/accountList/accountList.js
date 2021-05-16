import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class AccountList extends LightningElement {

   result;
   error;





    handleClick(){
        
        getAccounts()
            .then(result => {
                this.result = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = undefined;
            });
        
        }
    }