xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Articles"
    xml.description "Articles from Oval Ski Club."
    xml.link articles_url(format: :rss)
    
    for article in @articles
      xml.item do
        xml.title article.title       #Articles Title
        xml.description article.body  #Articles Body
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.author "Sam Rowell"
      end
    end
  end
end