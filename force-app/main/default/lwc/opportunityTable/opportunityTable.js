import { LightningElement, api, wire, track } from 'lwc';
import getOpportunity from '@salesforce/apex/GetSalesforceData.getOpportunity';
export default class OpportunityTable extends LightningElement {
                @track columns = [{
                    label: 'Opportunity Name',
                    fieldName: 'Name',
                    type: 'text',
                    sortable: true
                },

                {
                    label: 'Stage',
                    fieldName: 'StageName',
                    type: 'picklist',
                    sortable: true
                },

            ];
               
                @track error;
                @track data;
                @track defaultSortDirection = 'desc';
                @wire(getOpportunity)
                wiredOpportunity({error, data})
                {
                    if(data){
                        this.data = data;
                        
                    }
                    else if (error){
                        this.error = error;
                    }
                }
                sortBy(field, reverse, primer) {
                    const key = primer
                        ? function(x) {
                              return primer(x[field]);
                          }
                        : function(x) {
                              return x[field];
                          };
            
                    return function(a, b) {
                        a = key(a);
                        b = key(b);
                        return reverse * ((a > b) - (b > a));
                    };
                }
            
                onHandleSort(event) {
                    const { fieldName: sortedBy, sortDirection } = event.detail;
                    const cloneData = [...this.data];
            
                    cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
                    this.data = cloneData;
                    this.sortDirection = sortDirection;
                    this.sortedBy = sortedBy;
                }
            }