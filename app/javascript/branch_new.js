$(window).on('load',() => {
  const newContent = document.getElementsByClassName('new-cooking-content');
  if (!newContent) return null;

  const cat1 = $('#cat1');
  const cat2 = $('#cat2');
  const cat3 = $('#cat3');
  categoryCheck();
  $('.new-cooking-content').show();

  $('#category').on('change', categoryCheck);

  function categoryCheck() {
    let catVal = $('#category').val();
    if (catVal == 1) {
      $('#form-cat1').after(cat1);
      cat2.remove();
      cat3.remove();
    } else if (catVal == 2) {
      $('#form-cat2').after(cat2);
      cat1.remove();
      cat3.remove();
    } else if (catVal == 3) {
      $('#form-cat3').after(cat3);
      cat1.remove();
      cat2.remove();
    } else {
      cat1.remove();
      cat2.remove();
      cat3.remove();
    }
  }
})