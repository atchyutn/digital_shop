$(document).on("turbolinks:load", function(){
  $("a.add-to-cart").on("ajax:success", function(event) {
    response = event.detail[0];
    $("#cart-count").text(response.added_items_count)
  });
  
  $("a.remove-from-cart").on("ajax:success", function(event) {
    response = event.detail[0];
    if(response.added_items_count > 0){
      $("#cart-count").text(response.added_items_count);
      $("#cart_items_content").html(response.cart_items);
      $("#payment_details").html(response.payment_details);
    }
    else{
      document.location.href = "/";
    }
  });
});
