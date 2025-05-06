import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    const modal = document.querySelector("turbo-frame#modal")
    if (modal) modal.innerHTML = ""
  }
}