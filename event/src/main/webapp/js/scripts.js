(function ($) {
    "use strict";

    /* 
     ------------------------------------------------
     Sidebar open close animated humberger icon
     ------------------------------------------------*/

    $(".hamburger").on('click', function () {
        $(this).toggleClass("is-active");
    });

	$('.numberonly').keypress(function(e) {
		var charCode = (e.which) ? e.which : event.keyCode
		if (String.fromCharCode(charCode).match(/[^0-9]/g))
		return false;
	});

	$(".mobile").on('change', function() {
		console.log($(this).val());
		var inputvalues = $(this).val();
		var regex = /^([0|+[0-9]{1,5})?([7-9][0-9]{9})$/;
		if (!regex.test(inputvalues)) {
			$(this).val("");
			$("#mobileError").text("Please enter valid Mobile Number");
			return regex.test(inputvalues);
		}else{
			$("#mobileError").text("");
		}
	});
	
    /*  
     -------------------
     List item active
     -------------------*/
    $(".sidebar li a").each(function () {
        if (this.href === window.location.href) {
            $(this).parent().addClass("active");
            $(this).parent().parent().parent().addClass("active");
            $(this).parent().parent().parent().parent().parent().addClass("active");
        }
    });

    $('.header li').on('click', function () {
        $(".header li.active, .sidebar li.active").removeClass("active");
        $(this).addClass('active');
    });

    $(".header li").on("click", function (event) {
        event.stopPropagation();
    });

    $(document).on("click", function () {
        $(".header li").removeClass("active");

    });

//    $(function () {
//        $('.sidebar li a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('active');
//    }); 
    /*  
     -----------------
     Chat Sidebar
     ---------------------*/


    var open = false;

    var openSidebar = function () {
        $('.chat-sidebar').addClass('is-active');
        $('.chat-sidebar-icon').addClass('is-active');
        open = true;
    };
    var closeSidebar = function () {
        $('.chat-sidebar').removeClass('is-active');
        $('.chat-sidebar-icon').removeClass('is-active');
        open = false;
    };

    $('.chat-sidebar-icon').on('click', function (event) {
        event.stopPropagation();
        var toggle = open ? closeSidebar : openSidebar;
        toggle();
    });

    /*  Auto date in footer and refresh
     --------------------------------------*/

//    document.getElementById("date-time").innerHTML = Date();

    $('.page-refresh').on("click", function () {
        location.reload();
    });


    /* TO DO LIST 
     --------------------*/
    $(".tdl-new").on('keypress', function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code === 13) {
            var v = $(this).val();
            var s = v.replace(/ +?/g, '');
            if (s === "") {
                return false;
            } else {
                $(".tdl-content ul").append("<li><label><input type='checkbox'><i></i><span>" + v + "</span><a href='#' class='ti-close'></a></label></li>");
                $(this).val("");
            }
        }
    });


    $(".tdl-content a").on("click", function () {
        var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function () {
            _li.remove();
        });
        return false;
    });

    // for dynamically created a tags
    $(".tdl-content").on('click', "a", function () {
        var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function () {
            _li.remove();
        });
        return false;
    });



    /*  Chat Sidebar User custom Search
     ---------------------------------------*/

    $('[data-search]').on('keyup', function () {
        var searchVal = $(this).val();
        var filterItems = $('[data-filter-item]');

        if (searchVal !== '') {
            filterItems.addClass('hidden');
            $('[data-filter-item][data-filter-name*="' + searchVal.toLowerCase() + '"]').removeClass('hidden');
        } else {
            filterItems.removeClass('hidden');
        }
    });


    /*  Chackbox all
     ---------------------------------------*/

    $("#checkAll").change(function () {
        $("input:checkbox").prop('checked', $(this).prop("checked"));
    });


    /*  Vertical Carousel
     ---------------------------*/


//    $(window).bind("resize", function () {
//        //console.log($(this).width());
//        if ($(this).width() < 320) {
//            $('.logo').addClass('hidden');
//            $('.sidebar').removeClass('sidebar-shrink');
//            $('.sidebar').removeClass('sidebar-shrink, sidebar-gestures');
//        }
//    }).trigger('resize');



    /*  Search
     ------------*/
    $('a[href="#search"]').on('click', function (event) {
        event.preventDefault();
        $('#search').addClass('open');
        $('#search > form > input[type="search"]').focus();
    });

    $('#search, #search button.close').on('click keyup', function (event) {
        if (event.target === this || event.target.className === 'close' || event.keyCode === 27) {
            $(this).removeClass('open');
        }
    });


    //Do not include! This prevents the form from submitting for DEMO purposes only!
    $('form').submit(function (event) {
        event.preventDefault();
        return false;
    });
    /*  pace Loader
     -------------*/

//    paceOptions = {
//        elements: true
//    };


//    var stickyHeader = function () {
////        if(windowTopPosition===1){
////            $(window).scrollTop(10);
////        }
//        var windowTopPosition = $(window).scrollTop();
//        var triggerContainer = $('body').offset().top;
//       // var stickyContainer = $('.sidebar');
//        if (windowTopPosition > triggerContainer) {
//            stickyContainer.addClass('sticky');
//
//            stickyContainer.slideDown(0);
//        } else {
//            stickyContainer.removeClass('sticky');
//            stickyContainer.css("display", "");
//        }
//
//    };
//    $(window).scroll(stickyHeader);

    $('.close-div').click(function () {
        $(this).parent().remove();
        $('.sidebar').css("top", "0px");
    });
    $(window).resize(function () {
        var height = $('.header').height() + 18;
        $('.content-wrap').css("margin-top", height);
    });
    $(window).resize(); //on page load
})(jQuery);
