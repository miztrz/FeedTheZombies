module ProgFlow
  module_function
  def opensequence
    system 'clear'
    Process.setproctitle('Feed The Zombies')
    unless ProgFlow.has_internet? == true
      abort('Please check your network connection. This app relies heavily on an active network link.')
    end
    spawn(loadingzombies)
    Process.wait
    sleep 2
    ProgFlow.linebreak
    spawn('lolcat ui/welcome.txt')
    Process.wait
    ProgFlow.linebreak
    sleep 3
  end
  def has_internet?
    dns_resolver = Resolv::DNS.new
    begin
      dns_resolver.getaddress('telstra.com.au')
      return true
    rescue Resolv::ResolvError
      return false
    end
  end
  def linebreak
    TTY::Screen.width.times { print '=' }
  end
  def loadingzombies
    if TTY::Screen.width < 77
      'lolcat ui/ftz_err_zombie.txt'
    else
      'lolcat -a -s 180 ui/ftz_zombie.txt'
    end
  end
  


  def prompt
    @prompt = TTY::Prompt.new(help_color: :yellow)
  end
  def spinner
    TTY::Spinner.new(
      output: $stdout,
      hide_cursor: true,
      interval: 1,
      frames: [
        '‍💻👩‍                     🧟',
        '💻👩                    🧟 ',
        '💻👩                   🧟  ',
        '💻👩‍                  🧟   ',
        '💻👩‍                 🧟    ',
        '💻👩‍                🧟     ',
        '💻👩‍               🧟      ',
        '💻👩‍              🧟       ',
        '💻👩‍             🧟        ',
        '💻👩‍            🧟         ',
        '💻👩‍           🧟          ',
        '💻👩‍          🧟           ',
        '💻👩‍         🧟            ',
        '💻👩‍        🧟             ',
        '💻👩‍       🧟              ',
        '💻👩‍      🧟               ',
        '💻👩‍     🧟                ',
        '💻👩‍    🧟                 ',
        '💻👩‍   🧟                  ',
        '💻👩‍  🧟                   ',
        '💻👩‍ 🧟                    ',
        '💻👩‍🧟                     ',
        '💻🤦‍🧟                     ',
        '💻🤦‍🧟                     ',
        '💻🙍🧟                     ',
        '💻🙍🧟                     ',
        '💻🧟🧟                     ',
        '💻🧟🧟                     ',
        '💻🧟🧟                     '
      ]
    )
  end
end
