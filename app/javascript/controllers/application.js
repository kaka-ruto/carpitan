import { Application } from "@hotwired/stimulus"
import "../../assets/stylesheets/application.tailwind.css";
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
