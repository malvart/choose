$(() => {
  const searchContent = document.getElementsByClassName('search-content');
  if (!searchContent) return null;
  
  $('select[name="q[category_id_in]"]').attr('name', 'q[category_id_in][]')
})