class Responders::Rank< Responders::Base
  def channel_message msg, who, full_name
    case msg
      when /^!rank (\d+)$/
        if $1.to_i > 10
          say_to_chan "Cannot list more than top 10 contributors"
          return
        end
        
        contributors = HTTParty.get("http://github.com/api/v2/json/repos/show/resolve/refinerycms/contributors")["contributors"]    
        say_to_chan "Top #{$1} Contributors: " + contributor_list(contributors[0, $1.to_i])
      when /^!rank (.+)$/
        contributors = HTTParty.get("http://github.com/api/v2/json/repos/show/resolve/refinerycms/contributors")["contributors"]    
        usernames = $1.gsub(", ", " ").split
        
        contributors.delete_if {|c| !usernames.include?(c["name"])}
        say_to_chan "Comparing Contributors: " + contributor_list(contributors)
    end
  end
  
  def contributor_list contributors
    contributors.sort_by! {|c| c["contributions"]}
    
    string = []
    contributors.each do |c|
      string << c["name"] + " " + c["contributions"].to_s
    end
    
    string.join(", ")
  end
end