import { Tooltip } from "bootstrap"; // Assure-toi d'importer bootstrap ici

// Active les tooltips
// document.addEventListener("turbo:load", function() {
//   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
//   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//     return new Tooltip(tooltipTriggerEl);
//   });
// });

document.addEventListener("turbo:load", function () {
  var tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  );
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
});
