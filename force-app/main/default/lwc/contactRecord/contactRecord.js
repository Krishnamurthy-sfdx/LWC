import { LightningElement, api, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Invoice__c.Name';
import PASSWORD_FIELD from '@salesforce/schema/Invoice__c.Password__c';
import AMOUNT_FIELD from '@salesforce/schema/Invoice__c.Total_Amount__c';

const fieldsnew = [NAME_FIELD,PASSWORD_FIELD,AMOUNT_FIELD];
export default class ContactRecord extends NavigationMixin(LightningElement) {
  @api recordId;
  @api result;
  @api fields;

  

  handleSuccess(event){
    this.recordId = event.detail.id;
    const result = this.recordId;
    window.console.log(result);
  }

  @wire(getRecord, { recordId: '$recordId', fields: fieldsnew }) invoice;

// eslint-disable-next-line no-unused-vars
  handleSubmit(event) {
    window.console.log("I am here");
    this.dispatchEvent(
      new ShowToastEvent({
        title: "Sucess!",
        message: "Successfully saved",
        variant: "success"
      })
    );
  }

    get name(){
    window.console.log(this.invoice.data);
    return getFieldValue(this.invoice.data, NAME_FIELD);
  }

  get password(){
    window.console.log(this.invoice.data);
    return getFieldValue(this.invoice.data, PASSWORD_FIELD);
  }
  get amount(){
    window.console.log(this.invoice.data);
    return getFieldValue(this.invoice.data, AMOUNT_FIELD);
  }

  handleReset() {
    const inputFields = this.template.querySelectorAll("lightning-input-field");
    window.console.log("InputFields" + inputFields);
    if (inputFields) {
      inputFields.forEach(field => {
        field.reset();
      });
    }
  }

}

  
    //this.recordId = event.detail.id;
    /*this[NavigationMixin.Navigate]({
type: 'standard__objectPage',
attributes: {
  //recordId: this.recordId,
  objectApiName: 'Invoice__c', // objectApiName is optional
  actionName: 'list'
}
});
}*/

/*handleSuccess(event) {
    this.recordId = event.detail.id; 
    const record = this.recordId;
    const result = getFieldValue(record, PASSWORD_FIELD);
    window.console.log('result ' + result);
        }*/