<script src="/js/jquery.min.js"></script> 
	<!-- <script src="/js/jquery-3.5.1.min.js"></script> -->
	<script src="/js/jquery.nanoscroller.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/menubar/sidebar.js"></script>
	<script src="/js/preloader/pace.min.js"></script>
	<script src="/js/polyfill.min.js"></script>
	     <script src="/js/choices.min.js"></script>
	<script src="/js/scripts.js"></script>	
	<script src="/js/sweetalert/sweetalert.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<script src="/js/data-table/datatables.min.js"></script>
	<script src="/js/data-table/dataTables.buttons.min.js"></script>
	<script src="/js/data-table/buttons.flash.min.js"></script>
	<script src="/js/data-table/jszip.min.js"></script>
	<script src="/js/data-table/pdfmake.min.js"></script>
	<script src="/js/data-table/buttons.colVis.min.js"></script>
	<script src="/js/data-table/vfs_fonts.js"></script>
	<script src="/js/data-table/buttons.html5.min.js"></script>
	<script src="/js/data-table/buttons.print.min.js"></script>
	<script src="/js/data-table/datatables-init.js"></script>
	<script src="/js/select2/select2.full.js"></script>
	<script src="/js/select2/anchor.min.js"></script>
	 <script type="text/javascript" src="/js/moment-with-locales.min.js"></script>
	<script src="/js/date-picker/jquery-ui.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
 	<script type="text/javascript" src="/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/html5-editor/wysihtml5-0.3.0.js"></script>
    <script src="/js/html5-editor/bootstrap-wysihtml5.js"></script>
 
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
		/* function setTitle(ob) {
			$(ob).parent().attr("data-original-title", $(ob).val());
		} */
	</script>
	
	<script>
		$("#company").on('change',function() {
			var companyId = $(this).val();
			var companyName = $('#company').find(":selected").text();
	
			$("#companyName").val(companyName);
			$("#companyId").val(companyId);
			$("#queryData").css("display", "none");
			//$('#branch').addClass("progress");
			//callBranch(companyId);
	
			if (companyId == 0) {
				$("#branch").children().remove();
				//$("#queryData").css("display", "none");
				//$('#branch').addClass("progress");
			} else {

				$('#branch').addClass("progress");
				$.ajax({
					type : 'POST',
					url : "/eventApi/getBranchList",
					data : {
						companyId : companyId
					},
					dataType : "text",
					success : function(branchMap) {
						$('#branch').removeClass("progress");
						$("#branch").children().remove();
						var parsedData = JSON.parse(branchMap);
						
						//console.log(parsedData);
						$("#branch").append('<option value=0>-Select Branch-</option>');
						for (var i = 0; i < parsedData.length; i++) {
								$("#branch").append('<option value='+parsedData[i].branchId+'>'+ parsedData[i].branchName+ '</option>');
							
							$("#branchId").val(parsedData[i].branchId); //for 1
							$("#branchName").val(parsedData[i].branchName);
						}
						if(parsedData.length == 1){							
							document.getElementById("branch").selectedIndex = 1;
							$('#branch').change();							
						}
					}
				});
			}
		});
	</script>
	
	