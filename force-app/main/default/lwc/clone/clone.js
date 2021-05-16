import { LightningElement, api, track } from 'lwc';
import cloneContact from '@salesforce/apex/ContactClone.cloneContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class Clone extends  LightningElement {

@track account;
@api recordId;
@api objectApiName;

@api showModal = false;
@api modalHeading = 'Hello';

fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];


@api
closeModal() {
    this.showModal = false;
  
}

handleSubmit(event){
    event.preventDefault();       // stop the form from submitting
    const fields = event.detail.fields;
     // modify a field
    this.template.querySelector('lightning-record-form').submit(fields);
 }

@api
navigateRecord(){
    this.showModal = true;
  
}}


/*cloneContact({ accountId: this.recordId })
.then(result => {
    this.account = result;
    
})
.catch(error => {
    this.error = error;
     this.dispatchEvent(
    new ShowToastEvent({
                title: 'Success',
                message: 'Cloned Successfully',
                variant: 'success',
                mode: 'pester'
            })
    );
});  */