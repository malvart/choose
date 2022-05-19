$(() => {
  $('select[name="q[category_id_in]"]').attr('name', 'q[category_id_in][]')
})