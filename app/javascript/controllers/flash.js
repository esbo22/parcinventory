// app/javascript/controllers/flash.js

document.addEventListener('turbo:load', () => {
  console.log('Flash messages script loaded');  // Confirmer que le script est chargé

  setTimeout(() => {
    const flashMessages = document.querySelectorAll('.alert'); // Assurez-vous d'utiliser la bonne classe
    flashMessages.forEach(message => {
      console.log('Processing flash message'); // Vérifiez la sélection des messages
      message.style.transition = 'opacity 0.5s';
      message.style.opacity = '0';
      setTimeout(() => {
        message.remove(); // Enlève l'élément après la transition
      }, 500); // Temps pour que le message disparaisse complètement
    });
  }, 3000); // Temps avant que le message commence à disparaître (5 secondes)
});
