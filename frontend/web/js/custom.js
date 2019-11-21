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