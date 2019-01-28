class Gossip
  attr_accessor :author, :content

  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
    return
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    gossip_list = Gossip.all
    gossip_selected = {author: "test", content: "tests"}
    gossip_list.each_with_index do |gossip, index|
        if index == id
          gossip_selected = gossip
        end
    end     
    return gossip_selected 
  end

end