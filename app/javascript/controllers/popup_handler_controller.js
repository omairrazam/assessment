import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup-handler"
export default class extends Controller {
  static targets = ['mainForm', 'requestPhoneFieldInForm', 'bestMomentFieldInForm', 'popup', 'number', 'moment', 'numberSubmit']

  connect() {
  	this.mainFormTarget.addEventListener("submit", (e) => {
	    e.preventDefault();
    	this.popupTarget.classList.remove('hidden');
	});

  }

  numberSubmit = () => {

  	if(!!this.numberTarget.value && !!this.momentTarget.value) {
  		this.requestPhoneFieldInFormTarget.value = this.numberTarget.value
	  	this.bestMomentFieldInFormTarget.value = this.momentTarget.value
	  	this.popupTarget.classList.add('hidden');

	  	this.mainFormTarget.submit();
	}else{
	  	alert('please enter values')
	}
  	
  }

}
