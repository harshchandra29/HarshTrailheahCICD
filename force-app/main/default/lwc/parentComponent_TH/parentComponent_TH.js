import { LightningElement } from 'lwc';

export default class ParentComponent_TH extends LightningElement {

    handleOnChange(event)
    {
        console.log('--1-from parent to child'+event.target.value);
        
        this.template.querySelector(c-childComponent).messageToDisplay(event.target.value);
    }

    handlechildmsg(event)
    {
        console.log('-----msg from child-----'+event.detail);
    }
}