$('#favorite_buttons_<%= @diary.id %>').html("<%= j(render 'layouts/favorite', diary: @diary) %>");

console.log ("<%= j(render 'layouts/favorite',diary:@diary)  %>");