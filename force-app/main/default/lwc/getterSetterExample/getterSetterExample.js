import { LightningElement } from 'lwc';

export default class GetterSetterExample extends LightningElement {
    newMessage = 'This is an example for getter';
    finalMessage;

    get message(){
        console.log('I am in getter');
        return this.newMessage;
    }

    handleChange(event){
        this.message = event.target.value;
    }

    set message(value){
        this.finalMessage = value;
        console.log('I am in setter');
    }

}