import { Turbo } from "@hotwired/turbo-rails"
Turbo.start()

import $ from "jquery"
import "jquery-ui/ui/widgets/datepicker"

document.addEventListener("turbo:load", function() {
  function handleSelectChange(selectElement, inputElement) {
    selectElement.addEventListener('change', function() {
      if (selectElement.value === '') {
        inputElement.style.display = 'block';
        inputElement.value = '';
      } else {
        inputElement.style.display = 'none';
        inputElement.value = selectElement.value;
      }
    });

    if (selectElement.value === '') {
      inputElement.style.display = 'block';
    } else {
      inputElement.style.display = 'none';
      inputElement.value = selectElement.value;
    }
  }

  const processorSelect = document.getElementById('processor_select');
  const processorInput = document.getElementById('processor_input');

  const memorySelect = document.getElementById('memory_select');
  const memoryInput = document.getElementById('memory_input');

  if (processorSelect && processorInput) {
    handleSelectChange(processorSelect, processorInput);
  }

  if (memorySelect && memoryInput) {
    handleSelectChange(memorySelect, memoryInput);
  }
});
