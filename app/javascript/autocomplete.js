// app/javascript/autocomplete.js

document.addEventListener('DOMContentLoaded', () => {
  const input = document.getElementById('search-input');
  const resultsContainer = document.getElementById('autocomplete-results');

  if (input) {
    input.addEventListener('input', () => {
      const query = input.value;
      if (query.length < 2) {
        resultsContainer.innerHTML = "";
        return;
      }

      fetch(`/clients/autocomplete?query=${encodeURIComponent(query)}`, {
        headers: {
          "Accept": "application/json"
        }
      })
      .then(response => response.json())
      .then(data => {
        resultsContainer.innerHTML = data.map(client => `
          <li class="list-group-item">
            <a href="/clients/${client.id}">${client.name}</a>
          </li>
        `).join("");
      });
    });
  }
});
