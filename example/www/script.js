/* Custom logic*/
$(document).on("shiny:connected", function() {

  $('.StartRecord').click(function() {
  // setInterval(function(){
    setTimeout(function(){
                    console.log('In storage')
                    let getDataLocaleStorage = JSON.parse(localStorage.getItem('shinyStore-ex2\\dynamic_url'));
                    console.log(getDataLocaleStorage)
                    Shiny.setInputValue("foo", getDataLocaleStorage);

               }, 6000);



  })
  // }, 1000);
});
