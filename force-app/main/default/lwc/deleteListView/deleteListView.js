import { LightningElement, wire, track,api } from "lwc";
import deleteListVi from "@salesforce/apex/DeleteListView.deleteListVi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import deleteAccount from "@salesforce/apex/DeleteListView.deleteAccount";
import { refreshApex } from '@salesforce/apex';

export default class DeleteListView extends LightningElement {
  @track columns = [
    {
      label: "Id",
      fieldName: "accId"
    },
    {
      label: "Account Name",
      fieldName: "nameUrl",
      type: 'url',
      typeAttributes: {label: {fieldName: 'name'},target: '_blank'}
    },
    {
      label: "Website",
      fieldName: "website"
    }
  ];
  
  wiredResult;
  
  @track data;
  @api selectedIdsArray = [];
  @api recordId = [];

  @wire(deleteListVi)
  wireAccount(result) {
    this.wiredResult = result;
    if (result.data) {
      this.data = result.data;
      
    } else if (result.error) {
      this.error = result.error;
    }
  }

  getrowId(event) {
    this.selectedIdsArray = event.detail.selectedRows.map(element => element.accId );
    console.log(event.detail.selectedRows);
    console.log(this.selectedIdsArray);
  }
    
    /*const selectedRows = this.template.querySelector("lightning-datatable");
    var selected = selectedRows.getSelectedRows();
    

    for (const element of selected) {
      //console.log("elementid", element.Id);
      this.selectedIdsArray.push(element.Id);
    }
    console.log(this.selectedIdsArray);
  }*/

  handleClick(event) {

    console.log("selectedEvent " + this.selectedIdsArray);
    const recordId = this.selectedIdsArray;
    console.log('recordId '+ recordId );
    console.log(typeof(recordId));
    
    deleteAccount({accountIds: recordId})
    
      .then(result => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Account deleted",
            variant: "success"
          })
        );
        return refreshApex(this.wiredResult);
      })
      .catch(error => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error deleting record",
            message: "Error",
            variant: "error"
          })
        );
      });
  }

}