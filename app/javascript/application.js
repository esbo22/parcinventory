import { Turbo } from "@hotwired/turbo-rails";
import "bootstrap";
import * as Popper from "@popperjs/core";
import "./controllers/flash";
import "./autocomplete";
import "./tooltips";
import "./controllers/flash";


// initialisation pour les tooltips
const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});


