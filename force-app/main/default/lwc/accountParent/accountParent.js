import { LightningElement } from 'lwc';

export default class AccountParent extends LightningElement {

    childValue1;
    handleChildValue(event)
    {
        console.log('---val---'+event.detail);
        this.childValue1 = event.detail;
    }
}