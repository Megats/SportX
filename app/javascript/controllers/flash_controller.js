import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 2500);
  }

  dismiss() {
    this.element.remove();
  }
}