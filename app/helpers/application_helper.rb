module ApplicationHelper
	def gravatar_for(user, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" 
		image_tag(gravatar_url, alt: user.firstname,class: "gravatar")	
	end
	
	def avatar_for(user, options = { size: 80 })
	
		avatar_id = "#{(user.avatar)}"
		default_id = "/uploads/user/avatar/default.jpg"
		user_avatar = "/uploads/user/avatar/#{(user.id)}/default.jpg"
		
		if avatar_id == user_avatar
		image_tag(default_id, class: "gravatar")

		else
		user_profile = "/uploads/user/avatar/#{(user.id)}/thumb_profile.jpg"
		image_tag(user_profile, class: "gravatar")

		end
	end
	
end
