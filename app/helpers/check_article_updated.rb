
	def check_article_updated
		if article.updated_at != article.created_at
			"Updated: article.updated_at.strftime("%d/%m/%Y - %I:%M %p")"
		else
			"Posted: article.created_at.strftime("%d/%m/%Y - %I:%M %p")"
		end
	end


