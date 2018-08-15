function Scroll() {
    $('html, body').animate({scrollTop: $("#System_Message").offset().top-110}, 1000);
}

$('.Panel_Title').click(function(){
    if($(this).next('.Panel_Body').css('display') != 'none') {
        $(this).next('.Panel_Body').slideUp('fast');
        $(this).children('.Panel_Icon').removeClass('fa-folder-open');
        $(this).children('.Panel_Icon').addClass('fa-folder');
    }
    else {
        $(this).next('.Panel_Body').slideDown('fast');
        $(this).children('.Panel_Icon').removeClass('fa-folder');
        $(this).children('.Panel_Icon').addClass('fa-folder-open');
    }
});
