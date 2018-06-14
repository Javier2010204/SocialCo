$("#user-avatar .circle").css
	"background": "url(<%= @user.avatar.url(:thumb) %>)"
	"background-size": "cover"
$("#user-cover .circle").css
	"background": "url(<%= @user.cover.url(:thumb) %>)"
	"background-size": "cover"
	"background-position": "center"