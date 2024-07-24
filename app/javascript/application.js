import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true; // Assurez-vous que Turbo est activé


console.log("JavaScript is loaded and running");

document.addEventListener("turbo:load", function() {
  console.log("Turbo loaded");

  function syncFields(selectElement, inputElement, hiddenElement) {
    selectElement.addEventListener('change', function() {
      if (selectElement.value !== '') {
        inputElement.value = selectElement.value;
        hiddenElement.value = selectElement.value;
      } else {
        inputElement.value = '';
        hiddenElement.value = '';
      }
      console.log(`Select Changed: ${selectElement.id} - Value: ${selectElement.value}`);
    });

    inputElement.addEventListener('input', function() {
      if (inputElement.value !== '') {
        selectElement.value = '';
        hiddenElement.value = inputElement.value;
      } else {
        hiddenElement.value = '';
      }
      console.log(`Input Changed: ${inputElement.id} - Value: ${inputElement.value}`);
    });
  }

  const processorSelect = document.getElementById('processor_select');
  const processorInput = document.getElementById('processor_input');
  const processorHidden = document.getElementById('processor_hidden');

  const memorySelect = document.getElementById('memory_select');
  const memoryInput = document.getElementById('memory_input');
  const memoryHidden = document.getElementById('memory_hidden');

  if (processorSelect && processorInput && processorHidden) {
    syncFields(processorSelect, processorInput, processorHidden);
  }

  if (memorySelect && memoryInput && memoryHidden) {
    syncFields(memorySelect, memoryInput, memoryHidden);
  }

  const form = document.getElementById('computer_form');
  if (form) {
    form.addEventListener('submit', function(event) {
      if (processorInput.value === '' && processorSelect.value === '') {
        alert("Veuillez entrer ou sélectionner une valeur pour le processeur.");
        event.preventDefault();
      } else if (processorSelect.value !== '') {
        processorHidden.value = processorSelect.value;
      }

      if (memoryInput.value === '' && memorySelect.value === '') {
        alert("Veuillez entrer ou sélectionner une valeur pour la mémoire.");
        event.preventDefault();
      } else if (memorySelect.value !== '') {
        memoryHidden.value = memorySelect.value;
      }

      console.log(`Form Submit: Processor - Input: ${processorInput.value}, Select: ${processorSelect.value}, Hidden: ${processorHidden.value}`);
      console.log(`Form Submit: Memory - Input: ${memoryInput.value}, Select: ${memorySelect.value}, Hidden: ${memoryHidden.value}`);
    });
  } else {
    console.log("Form not found");
  }
});
