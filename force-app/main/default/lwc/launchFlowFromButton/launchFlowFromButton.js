/**
 * Created by rober on 2023. 02. 20..
 */

import { LightningElement } from 'lwc';

export default class LaunchFlowFromButton extends LightningElement {
    handleClick() {
            this.template.querySelector('lightning-flow').startFlow('CallLwcInFlow', this.inputVariables);
        }

        get inputVariables() {
            return [];
        }

        handleStatusChange(event) {
            console.log('handleStatusChange', event.detail);
        }
}