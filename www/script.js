/* Custom logic*/
$(document).on("shiny:connected", function() {
  //$('#widgetOutput').click(function() {
  setInterval(function(){
    setTimeout(function(){
                    let getDataLocaleStorage = JSON.parse(localStorage.getItem('shinyStore-ex2\\dynamic_url'));
                    // console.log(getDataLocaleStorage)
                    Shiny.setInputValue("foo", getDataLocaleStorage);

                }, 100);
  //})
  }, 1000);
});
