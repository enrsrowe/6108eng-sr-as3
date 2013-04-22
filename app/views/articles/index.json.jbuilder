json.channel do
    json.title "Articles"
    json.description "Articles from Oval Ski Club."
    json.link articles_url(format: :rss)

	json.articles @articles, :id, :title, :body, :updated_at

end