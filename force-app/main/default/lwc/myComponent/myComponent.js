import { LightningElement } from 'lwc';
import {myFunction} from './myComponent1';
export default class MyComponent extends LightningElement {
    
    handleClick(){
        myFunction(2,3);
    }
}