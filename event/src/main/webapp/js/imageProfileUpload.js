/**
 * bootstrap-imageupload v1.1.2
 * https://github.com/egonolieux/bootstrap-imageupload
 * Copyright 2016 Egon Olieux
 * Released under the MIT license
 */

if (typeof jQuery === 'undefined') {
    throw new Error('imageupload\'s JavaScript requires jQuery.');
}

(function ($) {
    'use strict';

    var options = {};

    var methods = {
        init: init,
        disable: disable,
        enable: enable,
        reset: reset
    };

    // -----------------------------------------------------------------------------
    // Plugin Definition
    // -----------------------------------------------------------------------------

    $.fn.imageupload = function (methodOrOptions) {
        var givenArguments = arguments;

        return this.filter('div').each(function () {
            if (methods[methodOrOptions]) {
                methods[methodOrOptions].apply($(this), Array.prototype.slice.call(givenArguments, 1));
            }
            else if (typeof methodOrOptions === 'object' || !methodOrOptions) {
                methods.init.apply($(this), givenArguments);
            }
            else {
                throw new Error('Method "' + methodOrOptions + '" is not defined for imageupload.');
            }
        });
    };

    $.fn.imageupload.defaultOptions = {
        allowedFormats: ['jpg', 'jpeg', 'png', 'gif'],
        maxWidth: 150,
        maxHeight: 100,
        maxFileSizeKb: 2048
    };

    // -----------------------------------------------------------------------------
    // Public Methods
    // -----------------------------------------------------------------------------

    function init(givenOptions) {
        options = $.extend({}, $.fn.imageupload.defaultOptions, givenOptions);

        var $imageupload = this;
        var $fileTab = $imageupload.find('.file-tab');
        var $fileTabButton = $imageupload.find('.panel-heading .btn:eq(0)');
        var $browseFileButton = $fileTab.find('input[type="file"]');
        var $removeFileButton = $fileTab.find('.btn:eq(1)');
        var $urlTab = $imageupload.find('.url-tab');
        var $urlTabButton = $imageupload.find('.panel-heading .btn:eq(1)');
        var $submitUrlButton = $urlTab.find('.btn:eq(0)');
        var $removeUrlButton = $urlTab.find('.btn:eq(1)');

        // Do a complete reset.
        resetFileTab($fileTab);
        resetUrlTab($urlTab);
        showFileTab($fileTab);
        enable.call($imageupload);

        // Unbind all previous bound event handlers.
        $fileTabButton.off();
        $browseFileButton.off();
        $removeFileButton.off();
        $urlTabButton.off();
        $submitUrlButton.off();
        $removeUrlButton.off();

        $fileTabButton.on('click', function () {
            $(this).blur();
            showFileTab($fileTab);
        });

        $browseFileButton.on('change', function () {
            $(this).blur();
            submitImageFile($fileTab);
        });

        $removeFileButton.on('click', function () {
            $(this).blur();
            resetFileTab($fileTab);
        });


    }

    function disable() {
        var $imageupload = this;
        $imageupload.addClass('imageupload-disabled');
    }

    function enable() {
        var $imageupload = this;
        $imageupload.removeClass('imageupload-disabled');
    }

    function reset() {
        var $imageupload = this;
        init.call($imageupload, options);
    }

    // -----------------------------------------------------------------------------
    // Private Methods
    // -----------------------------------------------------------------------------

//    function getAlertHtml(message) {
//        var html = [];
//        html.push('<div class="alert alert-danger alert-dismissible">');
//        html.push('<button type="button" class="close" data-dismiss="alert">');
//        html.push('<span>&times;</span>');
//        html.push('</button>' + message);
//        html.push('</div>');
//        return html.join('');
//    }
//
//    function getImageThumbnailHtml(src) {
//        return '<img src="' + src + '" alt="Image preview" style="max-width: ' + options.maxWidth + 'px; max-height: ' + options.maxHeight + 'px">';
//    }

    function getFileExtension(path) {
        return path.substr(path.lastIndexOf('.') + 1).toLowerCase();
    }

    function isValidImageFile(file, callback) {
        // Check file size.
        if (file.size / 1024 > options.maxFileSizeKb)
        {
            callback(false, 'File is too large (max ' + options.maxFileSizeKb + 'kB).');
            return;
        }

        // Check image format by file extension.
        var fileExtension = getFileExtension(file.name);
        if ($.inArray(fileExtension, options.allowedFormats) > -1) {
            callback(true, 'Image file is valid.');
        }
        else {
            callback(false, 'File type is not allowed.');
        }
    }


    function showFileTab($fileTab) {
        var $imageupload = $fileTab.closest('.imageupload');
        var $fileTabButton = $imageupload.find('.panel-heading .btn:eq(0)');

        if (!$fileTabButton.hasClass('active')) {
            var $urlTab = $imageupload.find('.url-tab');

            // Change active tab buttton.
            $imageupload.find('.panel-heading .btn:eq(1)').removeClass('active');
            $fileTabButton.addClass('active');

            // Hide URL tab and show file tab.
            $urlTab.hide();
            $fileTab.show();
            resetUrlTab($urlTab);
        }
    }

    function resetFileTab($fileTab) {
        $fileTab.find('.alert').remove();
        $fileTab.find('img').remove();
        $fileTab.find('.btn span').text('Choose File...');
        $fileTab.find('.btn:eq(1)').hide();
        $fileTab.find('input').val('');        
        document.getElementById('file-photo').setAttribute('src', "");
        document.getElementById('image-file').setAttribute('value', "");       
    }

    function submitImageFile($fileTab) {
        var $browseFileButton = $fileTab.find('.btn:eq(0)');
        var $removeFileButton = $fileTab.find('.btn:eq(1)');
        var $fileInput = $browseFileButton.find('input');

        $fileTab.find('.alert').remove();
        $fileTab.find('img').remove();
        $browseFileButton.find('span').text('Choose File...');
        $removeFileButton.hide();

        // Check if file was uploaded.
        if (!($fileInput[0].files && $fileInput[0].files[0])) {
            return;
        }

        $browseFileButton.prop('disabled', true);
        var file = $fileInput[0].files[0];

        isValidImageFile(file, function (isValid, message) {
            if (isValid) {
                var fileReader = new FileReader();
                fileReader.onload = function (e) {
                    // Show thumbnail and remove button.
                    // $fileTab.prepend(getImageThumbnailHtml(e.target.result));    
                    if (document.getElementById('image-file').value === '') {
                        document.getElementById('file-photo').setAttribute('src', e.target.result);// Used for Choose File
                        document.getElementById('image-file').setAttribute('value', e.target.result);
//                        $browseFileButton.find('span').text('Add More..');               
                    }
                    $removeFileButton.css('display', 'inline-block');
                };

                fileReader.onerror = function () {
                    sweetAlert("Oops...", "Error loading image file.", "warning");
                    //   $fileTab.prepend(getAlertHtml('Error loading image file.'));
                    $fileInput.val('');
                    document.getElementById('file-photo').setAttribute('src', "");                  
                };

                fileReader.readAsDataURL(file);
            }
            else {
                // $fileTab.prepend(getAlertHtml(message));
                sweetAlert("Oops...", message, "warning");
                $browseFileButton.find('span').text('Choose File...');
                document.getElementById('file-photo').setAttribute('src', "");                
                $fileInput.val('');
            }

            $browseFileButton.prop('disabled', false);
        });
    }

    function resetUrlTab($urlTab) {
        $urlTab.find('.alert').remove();
        $urlTab.find('img').remove();
        $urlTab.find('.btn:eq(1)').hide();
        $urlTab.find('input').val('');
    }
}(jQuery));
