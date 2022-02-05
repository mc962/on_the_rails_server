import { Controller } from "@hotwired/stimulus"

const HIDDEN_FLASH_CLASS = 'hidden-flash';

export default class extends Controller {
    static targets = ['flashContainer']

    close() {
        // Describe elements as hidden (although CSS display changes may override its visibility)
        this.flashContainerTarget.setAttribute('hidden', 'true');

        // Add class to hide flash from display
        this.flashContainerTarget.classList.add(HIDDEN_FLASH_CLASS);
    }
}
