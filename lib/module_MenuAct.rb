module MenuAct
  module_function
  def env_set
    unless File.exist?('.env') && Dir.exist?('.history')
      @new_env = true
    else
      @dir_history = {}
      Dir.children('.history').each do |f|
        @dir_history.store(File.ctime(".history/#{f}"), f.to_s)
      end
    end
  end

  def greet
    env_set
    if @new_env
      puts "Welcome to Feed The Zombies - where you can generate content from the news! This is a tool for play, not for pay, so please be respectful of that.
      The first step is to search for some news. I (your terminal interface insider) will guide you through each step, no muss no fuss.
      So what are you waiting for?!?"
      puts "For Feed The Zombies to work, you will need 2 API keys."
      puts "The first is available from newsapi.org (signup at newsapi.org/register)."
      puts "I'll wait here whilst you get that!"
      # wait 10
      puts "Got it? Please enter your news api key below:"
      newsapikey = gets.chomp
      puts "The next is available through deepai.org (we are mostly interested in the text generator, but they have some really cool other things too)."
      puts "Best get cracking on that deepai.org api key!"
      # wait 10
      puts "Got it? Please enter your deep ai api key below:"
      deepaiapikey = gets.chomp
      puts "Wooh! Will just run some diagnostics to confirm this is all working as expected."
      ProgFlow.linebreak
      puts ' '
      SpinMe.auto_spin
      File.open('.env', 'w') { |f| f.write 
      "NEWSAPI_KEY=#{newsapikey}
      DEEPAI_KEY=#{deepaiapikey}"}
      Dir.mkdir('.history')
      # wait 15
      SpinMe.stop
      ProgFlow.linebreak 
      puts "Rad! You are ready to go. Good luck!"
      puts ''
      ProgFlow.linebreak
      puts ''
      # wait 2
      $stage = news_choice
#     elsif @dir_history.empty?
#     puts "It looks like you've been around here before, but you haven't saved any history.
# First step generally speaking though is to search for some news. So lets go!"
#       $stage = news_choice
    else
      puts "I can see you have #{@dir_history.length} file(s) that have been generated previously."
      $stage = feature_choice
    end
  end
  def feature_choice
    feature_choice = ProgFlow.prompt.select('Would you like to review your historical files, create new content, or exit Feed The Zombie?', ['New Content', 'Historical Files', 'Exit'])

    $stage = if feature_choice == 'New Content'
               news_choice
             elsif feature_choice == 'Historical Files'
               historical_data
             else
               exit_wave
             end

    ProgFlow.linebreak
  end
  def news_choice
    puts 'Our default news search will get you the top headlines for technology in Australia.'
    news_choice = ProgFlow.prompt.yes?('Would you like to change this?')
    ProgFlow.linebreak
    $stage = if news_choice
               news_options
             else
               news_tophead
             end
  end
  def news_options
    @news_options = ProgFlow.prompt.multi_select('Please confirm which of these options you would like to modify:', echo: false) do |menu|
      menu.choice 'q: Keywords or phrases to search for in the article title and body.', 'q'
      menu.choice 'domains: Domain (eg bbc.co.uk, techcrunch.com, engadget.com) to restrict the search to.', 'domains'
      menu.choice 'from: A date and optional time for the oldest article. Please note this cannot be any earlier than 30 days ago.', 'from'
      menu.choice 'to: A date and optional time for the oldest article. Defaults to today.', 'to'
    end
    ProgFlow.linebreak
    $stage = news_optselect
  end
  def news_optselect
    news_refined = {}
    today = Date.today - 1
    date_from = today - 25
    @news_options.each do |x|
      case x
      when 'q'
        news_refined.store('q', ProgFlow.prompt.ask('Enter your keyword search.'))
      when 'domains'
        news_refined.store('domains', ProgFlow.prompt.ask('Enter the specific website/domain name.'))
      when 'from'
        news_refined.store('from', ProgFlow.prompt.ask('Enter the date from.', value: date_from.to_s, default: date_from.to_s))
      when 'to'
        news_refined.store('to', ProgFlow.prompt.ask('Enter the date from.', value: today.to_s, default: today.to_s))
        end
    end
    ProgFlow.linebreak
    puts news_refined.transform_keys(&:to_sym)
    ProgFlow.linebreak
    $stage = news_articles(**args = news_refined.transform_keys(&:to_sym))
  end
  def news_tophead(**args)
    @newsresult = ThisNews.get_top_headlines(country: 'AU', category: 'technology')
    $stage = news_result
  end
  def news_articles(**args)
    @newsresult = ThisNews.get_everything(**args)
    $stage = news_result
  end
  def news_result
    @newsarray = []
    loop_count = 0
    @newsresult.each do
      @newsarray <<
        "Title: #{@newsresult[loop_count].title}
          Published: #{@newsresult[loop_count].publishedAt}
          Description: #{@newsresult[loop_count].description}"
      loop_count += 1
    end
    $stage = articlechoice
  end
  def articlechoice
    $articlechoice = ProgFlow.prompt.select('Which of these articles would you like to use to create new content?', @newsarray)
    @articleindex = @newsarray.index($articlechoice)
    puts 'Good choice! This next part takes a while, so please enjoy some entertainment until then...'
    ProgFlow.linebreak
    puts ' '
    SpinMe.auto_spin
    @textgenerated = TextGen.new
    SpinMe.stop('A timely reminder to keep an eye on your surroundings whilst coding. You never know whats around!')
    ProgFlow.linebreak
    $stage = file_savechoice
  end
  def file_savechoice
    @selected_file = ProgFlow.prompt.ask('What would you like to call this file? Press enter to select the default option.', default: "#{@newsresult[@articleindex].title.gsub!(/[\W]/, '').slice(0..20)}.txt", help: '(Press enter to use the default value, or enter your own. No file extension required.)')
    File.write(".history/#{@selected_file}", @textgenerated.clean_text)
    puts "Great! Your file has been saved as #{@selected_file}."
    $stage = file_options
    ProgFlow.linebreak
  end
  def historical_data
    history_selection = ProgFlow.prompt.select('Please select file from the list:', @dir_history.map { |k, v| "#{k.to_s[0..9]}: #{v}" })
    @selected_file = history_selection[12..history_selection.length]
    ProgFlow.linebreak
    $stage = file_options
  end
  def file_options
    file_options = ProgFlow.prompt.select('Would you like to open the text file, or print the results to your terminal screen?', ['Open File on Desktop', 'Print to Terminal Screen'], help: "Print to Terminal will be in rainbow, you've been warned.")
    if file_options == 'Print to Terminal Screen'
      spawn("lolcat .history/#{@selected_file}")
      Process.wait
      sleep 2
    else
      spawn("nano .history/#{@selected_file}")
      Process.wait
      sleep 2
    end
    puts ''
    ProgFlow.linebreak
    puts ''
    puts ''
    $stage = feature_choice
  end
  def exit_wave
    ProgFlow.linebreak
    spawn('lolcat ui/exit.txt')
    exit
  end
end
