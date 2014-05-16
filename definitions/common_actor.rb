

def common_bot_actor :actor_def => {} do
  actor_def = params[:actor_def].dup
  bot_actor params[:name] do
    actor_def actor_def
  end

  # config context
  
  # create start script
  # start
end
