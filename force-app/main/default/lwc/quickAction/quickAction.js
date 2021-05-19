import { LightningElement, api } from 'lwc';

export default class QuickAction extends LightningElement {
    @api recordId;
  
 
    connectedCallback(){
        console.log('connectedCallback');        
        console.log('recordId: ' + this.recordId);           
    }

}