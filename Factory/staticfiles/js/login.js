const input = document.getElementById('first_name');

input.addEventListener('input', event => {
  if (input.value === '') {
    input.style.backgroundColor = 'lime';
  } else {
    input.style.backgroundColor = '';
  }
});