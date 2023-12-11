import { LightningElement } from 'lwc';

export default class AccountChild1 extends LightningElement {

    searchText;

    handleChangeEve(event)
    {
        this.searchText = event.target.value;
    }

    onclickEve(event)
    {
        const searchEvent = new CustomEvent('searcheventfunct', {detail: this.searchText})

        this.dispatchEvent(searchEvent);
    }
}