$(window).on('load',() => {
  const newContent = document.getElementsByClassName('new-cooking-content');
  if (!newContent) return null;
  
  let addForm = $('#add-form');
  addForm.remove();

  $('#add-form-btn').on('click',() =>{
    $('#standard').after(addForm);
  })
})