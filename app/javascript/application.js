// app/javascript/application.js

import { Turbo } from "@hotwired/turbo-rails"
Turbo.start()

import "jquery"
import "jquery-ui"
import "jquery-ujs"

// Code JavaScript pour initialiser les éléments et ajouter des fonctionnalités
document.addEventListener("turbo:load", function() {
  var selectProcessorField = document.getElementById('processor_select');
  var processorInputField = document.getElementById('processor_input');

  if (selectProcessorField && processorInputField) {
    selectProcessorField.addEventListener('change', function() {
      if (selectProcessorField.value === '') {
        processorInputField.style.display = 'block';
        processorInputField.value = '';
      } else {
        processorInputField.style.display = 'none';
        processorInputField.value = selectProcessorField.value;
      }
    });

    if (selectProcessorField.value === '') {
      processorInputField.style.display = 'block';
    } else {
      processorInputField.style.display = 'none';
      processorInputField.value = selectProcessorField.value;
    }
  }

  var selectMemoryField = document.getElementById('memory_select');
  var memoryInputField = document.getElementById('memory_input');

  if (selectMemoryField && memoryInputField) {
    selectMemoryField.addEventListener('change', function() {
      if (selectMemoryField.value === '') {
        memoryInputField.style.display = 'block';
        memoryInputField.value = '';
      } else {
        memoryInputField.style.display = 'none';
        memoryInputField.value = selectMemoryField.value;
      }
    });

    if (selectMemoryField.value === '') {
      memoryInputField.style.display = 'block';
    } else {
      memoryInputField.style.display = 'none';
      memoryInputField.value = selectMemoryField.value;
    }
  }
});
