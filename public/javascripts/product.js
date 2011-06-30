var add_image_handlers = function() {
  $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
  $('ul.thumbnails li').eq(0).addClass('selected');
  $('ul.thumbnails li a').click(function() {
    $("#main-image").data('selectedThumb', $(this).attr('href'));
    $('ul.thumbnails li').removeClass('selected');
    $(this).parent('li').addClass('selected');
    return false;
  }).hover(
          function() {
            $('#main-image img').attr('src', $(this).attr('href').replace('mini', 'product'));
          },
          function() {
            $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
          }
          );
};

function price_update(new_price) {
	$('.price.update').text(new_price);
};
 
jQuery(document).ready(function() {
  add_image_handlers();
});
 
jQuery(document).ready(function() {
  jQuery('#product-variants input[type=radio]').click(function (event) {
    var vid = this.value;
    var text = $(this).siblings(".variant-description").html();
 
    jQuery("#variant-thumbnails").empty();
    jQuery("#variant-images span").html(text);
 
    if (images[vid].length > 0) {
      $.each(images[vid], function(i, link) {
        jQuery("#variant-thumbnails").append('<li>' + link + '</li>');
      });
 
      jQuery("#variant-images").show();
    } else {
      jQuery("#variant-images").hide();
    }
 
    add_image_handlers();
 
    var link = jQuery("#variant-thumbnails a")[0];
 
    jQuery("#main-image img").attr({src: jQuery(link).attr('href')});
    jQuery('ul.thumbnails li').removeClass('selected');
    jQuery(link).parent('li').addClass('selected');

  });
  jQuery('#product-variants select.option-type').change(function (event) {
	$('.option.'+this.id).text(this.value);
	price_update("test");
	$("#popup_button_"+this.id)[0].title=this.value;
  });
});
