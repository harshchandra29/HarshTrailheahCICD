import { LightningElement, track } from 'lwc';
export default class HelloWorld extends LightningElement {
      hello="Hello World..!!";
      @track time="8:30 PM";
      @track greeting="Good Evening..!!";
      @track Todo = [];

      connectedCallback()
      {
        this.getTime();

        setInterval(() => 
        {
          this.getTime();
        }, 6000) ; 

      }

      getTime()
      {
         const dt = new Date();
         const hr = dt.getHours();
         const mn = dt.getMinutes();
         this.time = `${this.getHours(hr)} : ${this.getMins(mn)}`;

      }

      getHours(hour)
      {
          return hour;
      }

      getMins(min)
      {
        return min < 10 ? '0'+min : min;
      }

      updateName(event)
      {
        
        const inputName = this.template.querySelector('lightning-input');
        const todoObj  = {
          todoId : this.Todo.length,
          todoName : inputName.value,
          todoDone : false,
          todoDate : new Date()

        }
        
        this.Todo.push(todoObj);
         
        inputName.value = "";
      //console.log("called : "+event.target.value) ;
      //  const var1 = event.target.value;
      //if(var1 == "nameN")
       // console.log('name : '+var1.value);
     // else(var1 == "mobN")
      //  console.log('mob : '+var1.value);
  
      }
  }