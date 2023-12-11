import { MessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';
import Harsh from '@salesforce/messageChannel/Harsh__c';

export default class ShowAccountContact extends LightningElement {

    subscription=null;
    conId;
    conName;
    @wire (MessageContext) messageContext;

    connectedCallback()
    {
        console.log('---------sub--1-');
        this.handleSubscribe();
    }

    disconnectedCallback()
    {
        this.handleUnSubscribe();
        
    }

    handleSubscribe()
    {
        console.log('---------sub--2-');
        if(!this.subscription)
        {
            console.log('---------subs---');
            // 3rd param is annonemous method
            this.subscription = subscribe(this.messageContext, Harsh, (param)=>
            {
                this.conId=param.ContactId;
                this.conName=param.ContactName;
            }
            );
        }
    }

    handleUnSubscribe()
    {
        unsubscribe(this.subscription);
        this.subscription=null;
    }
}