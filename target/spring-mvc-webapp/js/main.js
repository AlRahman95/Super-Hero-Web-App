$(function(){
    var $select = $(".numbers");
    for (i=1;i<=20;i++){
        $select.append($('<option></option>').val(i).html(i));
    }
});
