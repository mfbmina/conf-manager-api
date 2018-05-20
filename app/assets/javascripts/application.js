// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require vendors/jquery-3.2.1.min
//= require vendors/bootstrap.bundle.min
//= require vendors/jquery.sparkline.min
//= require vendors/selectize.min
//= require vendors/chart.bundle.min
//= require vendors/jquery.tablesorter.min
//= require vendors/jquery-jvectormap-2.0.3.min
//= require vendors/jquery-jvectormap-de-merc
//= require vendors/jquery-jvectormap-world-mill
//= require vendors/circle-progress.min
//= require d3.v3.min
//= require c3.min
//= require jquery.mask.min
//= require_tree .

$(document).ready(function() {
    /** Constant div card */
    var DIV_CARD = 'div.card';

    /** Initialize tooltips */
    $('[data-toggle="tooltip"]').tooltip();

    /** Initialize popovers */
    $('[data-toggle="popover"]').popover({
        html: true
    });

    /** Function for remove card */
    $('[data-toggle="card-remove"]').on('click', function(e) {
        var $card = $(this).closest(DIV_CARD);

        $card.remove();

        e.preventDefault();
        return false;
    });

    /** Function for collapse card */
    $('[data-toggle="card-collapse"]').on('click', function(e) {
        var $card = $(this).closest(DIV_CARD);

        $card.toggleClass('card-collapsed');

        e.preventDefault();
        return false;
    });

    /** Function for fullscreen card */
    $('[data-toggle="card-fullscreen"]').on('click', function(e) {
        var $card = $(this).closest(DIV_CARD);

        $card.toggleClass('card-fullscreen').removeClass('card-collapsed');

        e.preventDefault();
        return false;
    });

    /**  */
    if ($('[data-sparkline]').length) {
        var generateSparkline = function($elem, data, params) {
            $elem.sparkline(data, {
                type: $elem.attr('data-sparkline-type'),
                height: '100%',
                barColor: params.color,
                lineColor: params.color,
                fillColor: 'transparent',
                spotColor: params.color,
                spotRadius: 0,
                lineWidth: 2,
                highlightColor: hexToRgba(params.color, .6),
                highlightLineColor: '#666',
                defaultPixelsPerValue: 5
            });
        };

        $('[data-sparkline]').each(function() {
            var $chart = $(this);

            generateSparkline($chart, JSON.parse($chart.attr('data-sparkline')), {
                color: $chart.attr('data-sparkline-color')
            });
        });
    }

    /**  */
    if ($('.chart-circle').length) {
        $('.chart-circle').each(function() {
            var $this = $(this);

            $this.circleProgress({
                fill: {
                    color: tabler.colors[$this.attr('data-color')] || tabler.colors.blue
                },
                size: $this.height(),
                startAngle: -Math.PI / 4 * 2,
                emptyFill: '#F4F4F4',
                lineCap: 'round'
            });
        });
    }
});