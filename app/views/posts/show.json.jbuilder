json.post do
	json.id @post.id
	json.body @post.body
	json.user_id @post.user_id
	json.created_at @post.created_at
	json.updated_at @post.updated_at
end