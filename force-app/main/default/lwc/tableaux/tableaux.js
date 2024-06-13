/**
 * Created by rober on 2023. 02. 06..
 */

import { LightningElement, api } from 'lwc';

export default class Tableaux extends LightningElement {

    @api strRecordId;
    @api recordId;
    arrayFields = ['Name'];
}