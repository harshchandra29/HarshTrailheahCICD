import { LightningElement, wire, track } from 'lwc';
import ContactLstFuncttemp from '@salesforce/apex/AccountController.ContactLstFunct';
import ContactLstFunctParam from '@salesforce/apex/AccountController.ContactLstFunctParam';
import {getRecord}  from 'lightning/uiRecordApi';

export default class TestLWCYoutube extends LightningElement {

    @track contactLst;
    @track columns = [
                    {label: 'Id', fieldName: 'Id'},
                    {label: 'Name', fieldName: 'Name'},
                    {label: 'Email', fieldName:'Email'}
                ];     
    
                            ;

    //method 1    
    @wire (ContactLstFuncttemp) wiredContact;

    //method 2
    @wire(ContactLstFunctParam, {strName: 'Harsh Chandra'}) wiredLstContact({data, error})
    {
        if(data)
        {   
            console.log('got the data');
            this.contactLst=data;
        }
        if(error)
            console.log('got the error');
    }
 }