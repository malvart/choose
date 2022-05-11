$(function (){
  const searchContent = document.getElementsByClassName('search-content');
  if (!searchContent) return null;

  const cat2 = $('#cat2');
  const cat3 = $('#cat3');
  const cat4 = $('#cat4');
  
  $(window).on('load', categoryCheck);
  $('#q_category_id_eq').on('change', categoryCheck);

  function categoryCheck(){
    let catVal = $('#q_category_id_eq').val();
    if (catVal == 2){
      $('#form-cat2').after(cat2);
      cat3.remove();
      cat4.remove();
    } else if (catVal == 3){
      $('#form-cat3').after(cat3);
      cat2.remove();
      cat4.remove();
    } else if (catVal == 4){
      $('#form-cat4').after(cat4);
      cat2.remove();
      cat3.remove();
    } else {
      cat2.remove();
      cat3.remove();
      cat4.remove();
    }
    $('.choose-content').show();
  }
})
