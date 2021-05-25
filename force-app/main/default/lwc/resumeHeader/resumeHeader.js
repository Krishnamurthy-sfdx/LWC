import { LightningElement } from 'lwc';
import MY_PIC from '@salesforce/resourceUrl/mypic';

export default class ResumeHeader extends LightningElement {
    myPic = MY_PIC;
    skills = [
        {id:"1", 
        Name:"Apex"},
        {id:"2", 
        Name:"SOQL"},
        {id:"3", 
        Name:"Visualforce"},
        {id:"4", 
        Name:"LWC"},
        {id:"5", 
        Name:"HTML"},
        {id:"6", 
        Name:"CSS"},
        {id:"7", 
        Name:"Javascript"}];
    }