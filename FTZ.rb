require 'date'
require 'resolv'
require 'json'
require 'rest-client'

require 'news-api'
require 'dotenv'
require 'tty-prompt'
require 'tty-spinner'
require 'tty-screen'

require_relative 'lib/module_MenuAct'
require_relative 'lib/module_ApiConnectors'
require_relative 'lib/module_ProgFlow'

Dotenv.load
SpinMe = ProgFlow.spinner
ThisNews = News.new(ENV['NEWSAPI_KEY'])
$stage = 'start'

def thisprogram
  case $stage
  when 'start'
    ProgFlow.opensequence
    MenuAct.greet
  when
    MenuAct.stage
  else
    MenuAct.feature_choice
  end
end

thisprogram
