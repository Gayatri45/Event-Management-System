<script src="/js/jquery.min.js"></script>
	<!--<script src="/js/jquery-3.5.1.min.js"></script>-->
	<script src="/js/jquery.nanoscroller.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/menubar/sidebar.js"></script>
	<script src="/js/preloader/pace.min.js"></script>
	<script src="/js/polyfill.min.js"></script>
	<script src="/js/scripts.js"></script>
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->	
	<script src="/js/select2/select2.full.js"></script>
	<script src="/js/select2/anchor.min.js"></script>
	 <script type="text/javascript" src="/js/moment-with-locales.min.js"></script>
	<script src="/js/date-picker/jquery-ui.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
	<script>
		anchors.options.placement = "left";
		anchors
				.add(".container h1, .container h2, .container h3, .container h4, .container h5");
		$.fn.select2.defaults.set("theme", "bootstrap");
		var placeholder = "-Select-";
		$(".select2-single, .select2-multiple").select2({
			placeholder : placeholder,
			width : null,
			containerCssClass : ":all:",
		});
		$(".select2-single, .select2-multiple")
				.on(
						"select2:open",
						function() {
							if ($(this).parents("[class*='has-']").length) {
								var classNames = $(this).parents(
										"[class*='has-']")[0].className
										.split(/\s+/);
								for (var i = 0; i < classNames.length; ++i) {
									if (classNames[i].match("has-")) {
										$("body > .select2-container")
												.addClass(classNames[i]);
									}
								}
							}
						});
		function setTitle(ob) {
			$(ob).parent().attr("data-original-title", $(ob).val());
		}
	</script>