# -*- coding: utf-8 -*-
class LinebotController < ApplicationController
protect_from_forgery :except => [:callback]
  helper_method :client

  def callback
    signature = request.env['HTTP_X_LINE_CHANNELSIGNATURE']
    puts request.env
    unless client.validate_signature(request.body.read, signature)
      return 'invalidation of signature'
    end
    
    receive_request = Line::Bot::Receive::Request.new(request.env)    
    receive_request.data.each { |message|
      case message.content
      when Line::Bot::Message::Text
        puts client.send_text(
                              to_mid: message.from_mid,
                              text: "かんなちゃん大好き",
                              )
      end
    }
    render :nothing => true
  end
end

