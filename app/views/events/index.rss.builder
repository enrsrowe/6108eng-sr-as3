xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Events"
    xml.description "Events from Oval Ski Club."
    xml.link events_url(format: :rss)
    
    for event in @events
      xml.item do
        xml.title event.title       #Events Title
        xml.description event.body  #Events Body
        xml.pubDate event.created_at.to_s(:rfc822)
        xml.author "Sam Rowell"
      end
    end
  end
end