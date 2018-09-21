window.setTimeout(function () {
  alert('HAMMER TIME!');
}, 5000);

function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}
