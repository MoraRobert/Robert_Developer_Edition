/**
 * Created by rober on 2023. 02. 20..
 */


import { LightningElement, wire, api, track} from 'lwc';
import getAccounts from'@salesforce/apex/PracticeLWC.getAccounts';
import getMoreAccounts from '@salesforce/apex/PracticeLWC.getMoreAccounts';

export default class PracticeFetchAndDisplay extends LightningElement {

     @track searchKey;
     @wire (getAccounts,{strAccountName: '$searchKey'}) accounts;
     handleKeyChange(event){
       this.searchKey = event.target.value;
     }

    @api recordId;
    record;

    @wire(getMoreAccounts, {recordId: '$recordId'})
    wiredAccount({ error, data }) {
        if (data) {
            this.record = data[0];
        } else if (error) {
            console.log('Something went wrong:', error);
        }
    }

    get myName() {
        return this.record?.Name;
    }

    get myIndustry() {
        return this.record?.Industry;
    }

    get myRating() {
        return this.record?.Rating;
    }

    get myWebsite() {
        return this.record?.Website;
    }
}