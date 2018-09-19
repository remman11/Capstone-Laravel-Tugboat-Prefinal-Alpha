$(document).ready(function(){
    $(function() {
        var sig = $('.signCanvas').signature();
        $('.clearCanvas').click(function() {
            sig.signature('clear');
        });
    });
    $('.btnButtons').on('click',function(e){
        e.preventDefault();
    });
// Change Views
    $('.showPending').on('click',function(){
        $('.contractPending').css('display','block');
        $('.contractRChanges').css('display', 'none');
        $('.contractAccepted').css('display','none');
    });
    $('.showRChanges').on('click',function(){
        $('.contractRChanges').css('display','block');
        $('.contractPending').css('display', 'none');
        $('.contractAccepted').css('display','none');
    });
    $('.showAccepted').on('click',function(){
        $('.contractAccepted').css('display', 'block');
        $('.contractPending').css('display','none');
        $('.contractRChanges').css('display','none');
    });
    $('.createContract').on('click',function(){
        $('.createContracts').css('display', 'block');
        $('.detLayout').css('display','none');
    });
    $('.btnEditRChanges').on('click',function(){
        $('.editContracts').css('display', 'block');
        $('.detLayout').css('display','none');
    });
    $('.btnBack').on('click',function(s) {
        s.preventDefault();
        $('.detLayout').css('display', 'block');
        $('.editContracts').css('display','none');
      });
    $('.modalClose').on('click',function(){
        $('#applySignatureModal').modal('hide');
    });
    $("#discountRange").ionRangeSlider({
        min: 1,
        max: 20,
        from: 1
    });
    $("#editDiscountRange").ionRangeSlider({
        min: 1,
        max: 20,
        from: 1
    });
    
});