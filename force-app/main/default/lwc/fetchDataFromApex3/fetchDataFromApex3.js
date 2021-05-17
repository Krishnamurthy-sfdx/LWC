import { LightningElement, wire } from 'lwc';
import getAllCases from '@salesforce/apex/CaseController.getAllCases';
import { NavigationMixin } from 'lightning/navigation';

export default class FetchDataFromApex3 extends NavigationMixin(LightningElement) {
    @wire(getAllCases) cases;

    viewRecord(event) {
        // Navigate to Account record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                "recordId": event.target.value,
                "objectApiName": "Case",
                "actionName": "view"
            },
        });
    }
}