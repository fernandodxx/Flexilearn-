// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Application } from "@hotwired/stimulus"
import ModalController from "./controllers/modal_controller"

window.Stimulus = Application.start()
Stimulus.register("modal", ModalController)
