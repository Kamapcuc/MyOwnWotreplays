$(document)
    .on('mouseover', '.tooltip', function () {
        var $tip = $('.tip');
        if ($tip.length != 0)
            return;

        $('body').append($tip = $('<div class="tip"></div>'));
        $tip.html($(this).find('.tooltip-container').html());
        $tip.show();

        $(document).on('mousemove', '.tooltip', function (e) {
            $tip.css({
                top: e.clientY + 15,
                left: e.clientX + 15
            });
        });
    })
    .on('mouseleave', '.tooltip', function () {
        var $tip = $('.tip');
        $tip.remove();
        $(document).off('mousemove', '.tooltip', function (e) {
            $tip.css({
                top: e.clientY + 15,
                left: e.clientX + 15
            });
        });
    });