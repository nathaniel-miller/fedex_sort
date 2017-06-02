$('div.dates').html("<%= escape_javascript(render partial: 'dates_unavailable', locals: { f: f } ) %>");
