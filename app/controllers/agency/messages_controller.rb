class Agency::MessagesController < ApplicationController
  def index
    @messages = policy_scope([:agency, Message])
  end
end
