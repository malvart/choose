$(window).on('load',() => {
  const newCategory = document.querySelector('#new-cat');
  if (newCategory) {
    const inputElement = document.getElementById('new-cat');
    $(inputElement).on("input", () => {
      const keyword = $('#new-cat').val();
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/cookings/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((category) => {
            const childElement = document.createElement("div");
            $(childElement).attr("class", "child");
            $(childElement).attr("id", category.id);
            childElement.innerHTML = category.category_name;
            $(searchResult).append(childElement);
            const clickElement = document.getElementById(category.id);
            $(clickElement).on("click", () => {
              $('#new-cat').val(clickElement.textContent);
              clickElement.remove();
              $('.child').remove();
            });
          });
        };
      };
    })
  }



})