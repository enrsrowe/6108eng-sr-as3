atom_feed do |feed|
  feed.title("Oval Ski Club - Articles")
  feed.updated(@articles.first.created_at)
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.body, :type => 'html')
      entry.author do |author|
        author.name "Sam Rowell" #article.author.username
      end
    end
  end
end