class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'line/bot'
  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_id = "1465666447"#ENV["LINE_CHANNEL_ID"]                                                                                                                      
      config.channel_secret = "c3d43c928e1d585da8214533b2d864b1"#ENV["LINE_CHANNEL_SECRET"]                                                                                        
      config.channel_mid = "u26b6b8a0feb3a295f46866ebeabd488a"#ENV["LINE_CHANNEL_MID"]                                                                                             
    }
  end

end
