$(document).ready(function() {
	$('.hiddenJournalView a').click(function(e) {
		e.preventDefault();
		var href = $(this).attr('href').split('?');
		var url = href[0];
		var params = href[1];
		
		journal = $(this);
		
		$.ajax({
			dataType: "json",
			url: url,
			data: params,
			success: function(data) {
				// alert('succes');
				var changed_to = data[0].changed_to;
				var id = params.split('=');
				if(changed_to == 'true') {
					console.log(changed_to);
					$('#change-' + id[1]).addClass('private-notes');
					console.log($(this));
					$(journal).removeClass("invisible").addClass("visible").attr('title', JOURNAL_ENABLE);
				} else if(changed_to == 'false') {
					console.log(changed_to);
					$('#change-' + id[1]).removeClass('private-notes');
					console.log($(this));
					$(journal).removeClass("visible").addClass("invisible").attr('title', JOURNAL_DISABLE);
				}
			},
			error: function(data) {
				alert('Error: Please reload!');
			}
		});
	});
});