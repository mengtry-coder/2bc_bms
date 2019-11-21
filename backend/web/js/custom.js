// Text area resize
var textarea = document.querySelector('textarea');

textarea.addEventListener('keydown', autosize);
                
function autosize(){
    var el = this;
    setTimeout(function(){
        el.style.cssText = 'height:auto;';
        el.style.cssText = 'height:' + el.scrollHeight + 'px';

    },0);
}
// End Text area resize

$("body").on("submit", "form", function() {
    $('#overlay').css({'display':'block','z-index':'9999'});
    $(this).submit(function() {
        return false;
    });
    return true;
});