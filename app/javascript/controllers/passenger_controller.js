// a controller specifically for adding/removing fields for passenger info on
// the booking form
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields"]

  add(event) {
    event.preventDefault()
    // clone the last passenger field and insert it before the add button
    const newField = this.fieldsTarget.cloneNode(true);
    const lastIndex = parseInt(this.fieldsTarget.querySelector('input').name.match(/\d+/)[0]);
    const newIndex = lastIndex + 1;
    newField.innerHTML = newField.innerHTML.replace(/\[[0-9]*\]/g, `[${newIndex}]`).replace(/_[0-9]*_/g, `_${newIndex}_`);
    this.fieldsTarget.insertAdjacentElement('beforebegin', newField);
  }

  remove(event) {
    event.preventDefault()
    const lastIndex = parseInt(this.fieldsTarget.querySelector('input').name.match(/\d+/)[0]);
    // if lastIndex == 0, flash error--we don't want to remove last set of fields
    if (lastIndex == 0) {
      alert("You must have at least one passenger.");
      return;
    };

    this.fieldsTarget.remove();
  }
}
