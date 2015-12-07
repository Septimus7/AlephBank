$(document).ready(function () {
    $('*').each(function () {
        var k = parseInt($(this).css('font-size'));
        $(this).data('original-font-size', k);
    });

    if ($.cookie('fontSize')) {
        setFontSize(parseInt($.cookie('fontSize')));
    }
})

function setFontSize(size) {
    if (size == 0) {
        $('*').each(function () {
            if ($(this).data('original-font-size')) {
                var k = parseInt($(this).data('original-font-size'));
                $(this).css('font-size', k);
            }
        });
    } else {
        var ratio = (size * 10) + 100;

        $('*').each(function () {
            var k;
            if ($(this).data('original-font-size')) {
                k = parseInt($(this).data('original-font-size'));
            } else {
                k = parseInt($(this).css('font-size'));
            }

            $(this).data('original-font-size', k);

            var newSize = ((k * ratio) / 100);
            $(this).css('font-size', newSize);
        });
    }

    $.removeCookie('fontSize');
    $.cookie('fontSize', size);

    $('.letter-size-button').removeClass('btn-info');
    $('.letter-size-button').addClass('btn-warning');

    $('.letter-size-button' + size).removeClass('btn-warning');
    $('.letter-size-button' + size).addClass('btn-info');
}