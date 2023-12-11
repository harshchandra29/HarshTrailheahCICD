import { LightningElement, api} from 'lwc';


export default class ChildComponent extends LightningElement {

    msg;

    @api messageToDisplay(strMsg)
    {
        console.log('from child');
        //this.msg=strMsg;
    }

    passmymsgtoparent(event)
    {
        const pubEvent = new CustomEvent('msgfromchild', {detail: 'hello parent, I am calling from child cmp'});

        this.dispatchEvent(pubEvent);
    }
}