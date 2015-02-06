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
    })
    .on('click', '.t_label', function (e) {
        e.preventDefault();
        var $this = $(this);
        if ($this.hasClass('active'))
            return false;
        else {
            var $prevActive = $this.closest('.t_labels').find('.active');
            $prevActive.removeClass('active');
            $('#' + $prevActive.attr('data-target')).removeClass('active');

            $this.addClass('active');
            $('#' + $this.attr('data-target')).addClass('active');

            var height = $('.m-item_container').height();
            $('.main-menu').css('margin-bottom', height + 25);
            return true;
        }
    });