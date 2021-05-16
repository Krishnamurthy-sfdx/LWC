import { LightningElement, wire, api} from 'lwc';
import getRecord from '@salesforce/apex/AccountController.getAccounts';

export default class FetchDataFromApex extends LightningElement {
    
    
@api recordId;
record;

@wire(getRecord, {recordId: '$recordId'})
wiredAccount ({error, data}) {
    if (error) {
        console.log('Something went wrong', error.body.value)
    } else if (data) {
        this.record = data;
        console.log(this.record);
    }
}


get myName() {
    return this.record.Name;

}

get myIndustry() {
    return this.record.Industry;
}


get myRating() {
    return this.record.Rating;
}


get myWebsite() {
    return this.record.Website;
}
}