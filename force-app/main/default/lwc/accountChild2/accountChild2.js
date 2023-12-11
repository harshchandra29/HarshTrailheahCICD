import { LightningElement, api, wire } from 'lwc';
import getContactFromSearch from '@salesforce/apex/AccountController.getContactFromSearch';
import { publish, MessageContext } from 'lightning/messageService';
import Harsh from '@salesforce/messageChannel/Harsh__c';

export default class AccountChild2 extends LightningElement {

    @api searchtextchild2;

    @wire (MessageContext) messageContext;
    contactLst;
    currentRecId;
    currentRecName;

    columns=[{label: 'Id', fieldName: 'Id'}, 
            {label: 'Name', fieldName: 'Name'},
            {label: 'Email', fieldName: 'Email'},  
            {label: 'Action', fieldName: 'Action', type: 'button', typeAttributes:{label: 'View Contact', value: 'view_contact'}
            }];

    @wire(getContactFromSearch, {strSearch: '$searchtextchild2'}) wiredContact({data, error})
    {
        if(data)
            this.contactLst = data;
        if(error)
            console.log('error----'+error); 
    }     

    handleRowAction(event)
    {
        if(event.detail.action.value='view_contact')
        {
            this.currentRecId = event.detail.row.Id;
            this.currentRecName = event.detail.row.Name;
            //alert('---this.currentRecId---'+event.detail.row.Name);

            const payLoad=
            {
                contactId : event.detail.row.Id,
                contactName : event.detail.row.Name
            };
            console.log('---------pub--1-');
            // 3 param - message contect class
            publish(this.messageContext, Harsh, payLoad);
            console.log('---------pub--2--');
        }

        
    }
}