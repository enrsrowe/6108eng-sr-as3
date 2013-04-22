atom_feed do |feed|
  feed.title("Oval Ski Club - Events")
  feed.updated(@events.first.created_at)
  @events.each do |event|
    feed.entry(event) do |entry|
      entry.title(event.title)
      entry.content(event.body, :type => 'html')
      entry.author do |author|
        author.name "Sam Rowell" #event.author.username
      end
    end
  end
end