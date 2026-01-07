(function ($) {
    $(function () {
        $('#datetimepicker6').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            minDate: (moment(new Date())),
            "format": "DD-MMM-YYYY hh:mm A"
        });
        $('#datetimepicker7').datetimepicker({
            "allowInputToggle": true,
            "showClose": true,
            "showClear": true,
            "showTodayButton": true,
            "format": "MM/DD/YYYY"
        });
    });
})(jQuery);
