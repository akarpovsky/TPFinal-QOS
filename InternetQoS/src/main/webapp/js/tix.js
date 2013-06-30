$(document).ready(function() {
	$(document).ready(function() {

		$(".toggler").click(function() {
			$(this).parent().toggleClass('listExpanded');
			$(this).parent().toggleClass('listCollapsed');
			$(this).toggleClass('active, inactive');
		})

	})
});