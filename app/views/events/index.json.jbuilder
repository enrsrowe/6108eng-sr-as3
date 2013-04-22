json.channel do
    json.title "Events"
    json.description "Events from Oval Ski Club."
    json.link events_url(format: :rss)

	json.events @events, :id, :title, :body, :updated_at

end