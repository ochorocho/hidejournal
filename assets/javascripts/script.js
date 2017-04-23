$(document).ready(function() {
	$('.hidden_journal_view a').click(function(e) {
		e.preventDefault();
		var href = $(this).attr('href').split('?');
		var url = href[0];
		var params = href[1];
		
		var journal = $(this);
		
		$.ajax({
			dataType: "json",
			url: url,
			data: params,
			success: function(data) {
				var changed_to = data[0].changed_to;
				var id = params.split('=');
				if(changed_to == 'true') {
					$('#change-' + id[1]).addClass('private-notes');
					$(journal).removeClass("invisible").addClass("visible").attr('title', JOURNAL_ENABLE);
				} else if(changed_to == 'false') {
					$('#change-' + id[1]).removeClass('private-notes');
					$(journal).removeClass("visible").addClass("invisible").attr('title', JOURNAL_DISABLE);
				}
			},
			error: function() {
				alert('Error: Please reload!');
			}
		});
	});
});