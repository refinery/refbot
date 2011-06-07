require File.dirname(__FILE__) + "/../spec_helper"

describe "Rank" do
  it "should rank the top 5 contributors" do
    @bot.message :channel => "!rank 5"
    @bot.channel_messages.should include "Top 5 Contributors:"
  end
  
  it "should rank a list of contributors" do
    @bot.message :channel => "!rank parndt, stevenheidel ugisozols"
    @bot.channel_messages.should include "Comparing Contributors:"
  end
end