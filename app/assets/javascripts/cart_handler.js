$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

// $(document).on("turbolinks:load", function(){
//   $("body").on("click", ".add-to-cart", function(event){
//     event.preventDefault();
//     product = $(this);
//     $.ajax({
//       url: product.attr('href'),
//       beforeSend: function(xhr) {
//         product.attr('disabled',)
//       },
//       type: "POST",
//       dataType: "JSON",
//       success: function(data){
// 
//       },
//       error: function(jqxhr){
// 
//       },
//       complete: function(){
//         console.log("request completed");
//       }
//     });
//   });
// });
