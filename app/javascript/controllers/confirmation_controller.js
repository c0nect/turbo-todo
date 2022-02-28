import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { message: String };

    delete(event) {
        // console.log("aq")
        if (!(window.confirm("Are you sure? 🥲"))) {
            // console.log("aaaaaa")
            event.preventDefault();
            event.stopImmediatePropagation();
        };
    };
}