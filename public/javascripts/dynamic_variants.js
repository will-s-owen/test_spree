<script type="text/javascript">
    $(document).ready(function(){
        $("select#gallery_section_id").change(function(){
            var id_value_string = $(this).val();
            //if (id_value_string == "") {
            //    // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            //    $("select#gallery_sub_section_id option").remove();
            //    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            //    $(row).appendTo("select#gallery_sub_section_id");
            //}
            //else {
                // Send the request and update sub category dropdown
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/sub_sections/for_sectionid/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){                    
                        // Clear all options from sub category select
                        $("select#gallery_sub_section_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                        $(row).appendTo("select#gallery_sub_section_id");                        
                        // Fill sub category select
                        $.each(data, function(i, j){
                            row = "<option value=\"" + j.sub_section.id + "\">" + j.sub_section.name + "</option>";  
                            $(row).appendTo("select#gallery_sub_section_id");                    
                        });            
                     }
                });
            //};
                });
    });
</script>